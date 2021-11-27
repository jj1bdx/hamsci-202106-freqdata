#!/bin/sh
# Usage:
#  ./ampl-measure.sh wav_filename unixdate.with_fraction
# Usage example:
#  ./ampl-measure.sh JJ1BDX_Z__2020-12-08_08-19-45.wav 1607415585.218517
FILENAME=$1
FILEPATH=`echo "${FILENAME}" | awk 'BEGIN{FS=".";}{printf("%s",$1);for(n=2;n<NF;n++){printf(".%s",$n);}}'`
SRCFILE=${FILEPATH}-ampl-source.txt
DSTFILE=${FILEPATH}-ampl.txt
SEC=`echo "$2" | awk 'BEGIN{FS=".";}{print $1;}'`
SUBSEC=`echo "$2" | awk 'BEGIN{FS=".";}{print $2;}'`
#
#echo "${FILENAME} ${FILEPATH} ${SRCFILE} ${DSTFILE} ${SEC} ${SUBSEC}"
#exit 0
#
# 996 ~ 1004Hz
#
sox -t wav ${FILENAME} -t raw --rate 8000 --bits 32 --channels 1 \
    --encoding floating-point --endian little - | \
csdr dsb_fc | \
csdr bandpass_fir_fft_cc 0.1245 0.1255 0.0001 | csdr amdemod_cf | \
./valuedumpdb > ${SRCFILE}
awk -v sec=${SEC} -v subsec=${SUBSEC} '{t = $1; v = $2; ut = t + sec; print "" ut "." subsec, v;}' \
    ${SRCFILE} > ${DSTFILE}
