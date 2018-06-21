#!/bin/sh

INPUT_DIR=$1
OUTPUT_DIR=$2

lola_exe=$(find /opt -name 'lola' 2>&1)

cd $INPUT_DIR

$lola_exe $(cat cli_parameters.txt) &> runlog.txt


cp ./*.txt ../$OUTPUT_DIR
# --- EOF ---
