# hamsci-202106-freqdata

This repository contains [HamSCI June 2021 Eclipse Festival of Frequency Measurement](https://hamsci.org/june-2021-eclipse-festival-frequency-measurement) result from my home station JJ1BDX in Setagaya City, Tokyo, Japan at Grid Locator PM95tp.

## Measurement date and time

7-JUN-2021 0000UTC - 12-JUN-2021 2359UTC

## Measurement equipments

* Antenna: 2.2m-length 30m-band whip at 8m height above the ground
* SDR frontend: Airspy HF+ Discovery, without GPSDO
* SDR software: [airspy-fmradion](https://github.com/jj1bdx/airspy-fmradion) 20210427-0, running on Ubuntu 21.04 x86\_64 (Intel NUC NUC10i7FNH)
* Recorded 8kHz-rate WAV files at approx. 9999kHz USB
* Airspy HF+ Discovery offset: 0.83Hz lower (i.e., 10MHz was mapped to 1000.83Hz), measured by Leo Bodnar mini GPSDO after the signal measurement was completed

## Measured data

* Estimated frequency of received AM carrier for the standard frequency stations (BPM, WWVH, WWV were observable)
* Estimated signal strength (by airspy-fmradion dBFS IF strength reading)
* GPSDO offset measured after the frequency measurement 

## Files in this repository

* aggregated-values/: merged data of from the measured-values/ directory files, and the calculation/estimation/visualization R code
* graphs/: summary graphs by date
* measured-values/: measured data by analyzing the recorded WAV files
* measurement-code/: the WAV file analysis code in [csdr](https://github.com/ha7ilm/csdr) and C

## Acknowledgment

* Kristina Collins, KD8OXT
* [HamSCI](https://www.hamsci.org) people and community
* [Pepabo R&D Institute, GMO Pepabo, Inc.](https://rand.pepabo.com), for their financial and moral support

## LICENSE

CC0

## Measurement result summary example as the graph for 10-JUN-2021

![](graphs/graph-20210610.png)
