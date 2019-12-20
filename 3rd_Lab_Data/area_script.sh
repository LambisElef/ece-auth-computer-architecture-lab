#!/bin/bash

for i in {0..9}
do
  python area_script.py mcpat_results/mcpat_result_specbzip_$i.txt spec_results/specbzip_$i/stats.txt 
done

for i in {0..9}
do
  python area_script.py mcpat_results/mcpat_result_specmcf_$i.txt spec_results/specmcf_$i/stats.txt 
done

for i in {0..9}
do
  python area_script.py mcpat_results/mcpat_result_spechmmer_$i.txt spec_results/spechmmer_$i/stats.txt 
done

for i in {0..16}
do
  python area_script.py mcpat_results/mcpat_result_specsjeng_$i.txt spec_results/specsjeng_$i/stats.txt 
done

for i in {0..10}
do
  python area_script.py mcpat_results/mcpat_result_speclibm_$i.txt spec_results/speclibm_$i/stats.txt 
done
