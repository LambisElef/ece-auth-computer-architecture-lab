#!/bin/bash

for i in {0..9}
do
  ../mcpat/mcpat -infile mcpat_xml/specbzip_$i.xml -print_level 5 > mcpat_result_specbzip_$i.txt
done

for i in {0..9}
do
  ../mcpat/mcpat -infile mcpat_xml/specmcf_$i.xml -print_level 5 > mcpat_result_specmcf_$i.txt
done

for i in {0..9}
do
  ../mcpat/mcpat -infile mcpat_xml/spechmmer_$i.xml -print_level 5 > mcpat_result_spechmmer_$i.txt
done

for i in {0..16}
do
  ../mcpat/mcpat -infile mcpat_xml/specsjeng_$i.xml -print_level 5 > mcpat_result_specsjeng_$i.txt
done

for i in {0..10}
do
  ../mcpat/mcpat -infile mcpat_xml/speclibm_$i.xml -print_level 5 > mcpat_result_speclibm_$i.txt
done
