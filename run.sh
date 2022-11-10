#!/usr/bin/env bash

# Exit on error
set -ex

# Reset results directory
rm -rf results
mkdir -p results

wget -P data/ https://dev.commons.asu.edu/data/abmclub/wolf-sheep/static.csv

# Run model via NetLogo
~/netlogo/netlogo-headless.sh \
    --experiment "vary_food_gains" \
    --model "src/wolf-sheep-predation.nlogo" \
    --table "results/vary_food_gains.csv"

# Render RMarkDown output
Rscript -e "rmarkdown::render('./src/wolf_sheep_AB.Rmd', output_file = '../results/wolf_sheep_AB.html')"