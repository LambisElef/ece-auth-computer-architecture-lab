#!/bin/bash

for i in {0..9}
do
  python GEM5ToMcPAT.py spec_results/specbzip_$i/stats.txt spec_results/specbzip_$i/config.json ../mcpat/ProcessorDescriptionFiles/inorder_arm.xml -o specbzip_$i.xml
done

for i in {0..9}
do
  python GEM5ToMcPAT.py spec_results/specmcf_$i/stats.txt spec_results/specmcf_$i/config.json ../mcpat/ProcessorDescriptionFiles/inorder_arm.xml -o specmcf_$i.xml
done

for i in {0..9}
do
  python GEM5ToMcPAT.py spec_results/spechmmer_$i/stats.txt spec_results/spechmmer_$i/config.json ../mcpat/ProcessorDescriptionFiles/inorder_arm.xml -o spechmmer_$i.xml
done

for i in {0..16}
do
  python GEM5ToMcPAT.py spec_results/specsjeng_$i/stats.txt spec_results/specsjeng_$i/config.json ../mcpat/ProcessorDescriptionFiles/inorder_arm.xml -o specsjeng_$i.xml
done

for i in {0..10}
do
  python GEM5ToMcPAT.py spec_results/speclibm_$i/stats.txt spec_results/speclibm_$i/config.json ../mcpat/ProcessorDescriptionFiles/inorder_arm.xml -o speclibm_$i.xml
done
