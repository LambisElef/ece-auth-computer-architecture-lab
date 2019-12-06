# Computer_Architecture_Lab
Lab results for "Computer Architecture" AUTh course by students Eleftheriadis Charalampos (9257) and Chamou Eleni (9065)

## 1st Lab

### Hello
The results of the execution of the program are placed into the "hello_result" folder.

| Table           | Value         | Location in starter_se.py                                   |
| --------------- | ------------- | ----------------------------------------------------------- |
| CPU Type        | Minor         | cpu_types = {...}                                           |
| CPU Clock       | 4GHz          | parser.add_argument("--cpu-freq", type=str, default="4GHz") |
| Caches          | L1I, L1D, WalkCache, L2 | "minor" : (MinorCPU, devices.L1I, devices.L1D, devices.WalkCache, devices.L2) |
| Cache Line Size | 64 Bytes      | cache_line_size = 64                                        |
| Memory Type     | DDR3_1600_8X8 | parser.add_argument("--mem-type", default="DDR3_1600_8x8"   |
| Memory Channels | 2             | parser.add_argument("--mem-channels", type=int, default=2   |
| Memory Size     | 2GB           | parser.add_argument("--mem-size", action="store", type=str, default="2GB" |

More information about caches' size and associativity can be found in config.ini.

### In-order CPU Types
* #### MinorCPU
  Minor is an in-order processor model with a fixed pipeline but configurable data structures and execute behaviour. It is intended to be used to model processors with strict in-order execution behaviour and allows visualisation of an instruction's position in the pipeline through the MinorTrace/minorview.py format/tool. The intention is to provide a framework for micro-architecturally correlating the model with a particular, chosen processor with similar capabilities.

* #### SimpleCPU
  The SimpleCPU is a purely functional, in-order model that is suited for cases where a detailed model is not necessary. This can include warm-up periods, client systems that are driving a host, or just testing to make sure a program works. It is now broken up into three classes, the BaseSimpleCPU, the AtomicSimpleCPU and the TimingSimpleCPU.

### Our benchmarks using qsort.c

| MinorCPU + DDR4_2400_8x8 | Time (in ms) |
| ------------------------ |--------------|
| 1Ghz                     | 5.994        |
| 1GHz + -O3 flag          | 5.345        |
| 2GHz                     | 3.070        |

| TimingSimpleCPU + DDR4_2400_8x8 | Time (in ms)  |
| ------------------------------- |---------------|
| 1Ghz                            | 16.437        |
| 2GHz                            | 8.274         |

| MinorCPU 1GHz    | Time (in ms)  |
| ---------------- |---------------|
| DDR4_2400_8x8    | 5.994         |
| LPDDR3_1600_1x32 | 6.022         |

| TimingSimpleCPU 1GHz | Time (in ms)  |
| -------------------- |---------------|
| DDR4_2400_8x8        | 16.437        |
| LPDDR3_1600_1x32     | 16.451        |

### Notes
As expected, the execution time was cut in half when the frequency was doubled. What's more there was no noticeable difference regarding the execution time with different memory types, because our program wasn't memory intensive. The needed data was transfered to cache only once and there were no cache misses.  
We also implemented a version with the gcc flag -O3, which indeed resulted in ~10% faster execution.

### Lab Assignment Review (in greek)
Θεωρούμε ότι το πρώτο εργαστήριο του μαθήματος πέτυχε το σκοπό του όπως επισημάνθηκε στις σημειώσεις του. Οι οδηγίες για την εγκατάσταση του Gem5 ήταν ακριβείς και λειτούργησαν όπως αναμενόταν στην τελευταία έκδοση 19.10 Ubuntu. Ιδιαίτερα βοηθητικό ήταν το κομμάτι με τις προτεραιότητες για τις διάφορες εκδόσεις του gcc που έχουμε πλέον εγκατεστημένες.  
Όσον αφορά στη χρήση του Gem5, αρχικά είχαμε μπερδευτεί αρκετά γύρω από διάφορα πράγματα, το python script για την επιλογή του υλικού προσομοίωσης και τα flags του κάθε script, τη συχνότητα προσομοίωσης, τα πολλαπλά πεδία στα αρχεία stats και config και τον τρόπο με τον οποίο έπρεπε να βρούμε αυτά που μας ενδιέφεραν. Βέβαια, με λίγες ώρες παρατήρησης των αρχείων και χρήσης του documentation του προσομοιωτή καταφέραμε να καταλάβουμε τα ζητούμενα και είμαστε πλέον ικανοί να διαβάζουμε τα στατιστικά με σχετική ευκολία.  
Τέλος, θα θέλαμε να είχαμε "παίξει" λίγο παραπάνω με το εκτελέσιμο πρόγραμμα, για παράδειγμα να το κάναμε περισσότερο memory intensive, ώστε οι διάφορες τοπολογίες μνήμης (τόσο τεχνολογία, όσο και κανάλια) να επηρέαζαν περισσότερο το χρόνο εκτέλεσης, ωστόσο λόγω λοιπών υποχρεώσεων ελπίζουμε να δοκιμάσουμε αργότερα.

### Sources
* http://gem5.org/


## 2nd Lab

### Stage one

| MinorCPU Cache Info    | Value         |
| ---------------------- | ------------- |
| Cache Line Size        | 64 B          |
| L1 D Size              | 64 KB         |
| L1 D Associativity     | 2-way         |
| L1 I Size              | 32 KB         |
| L1 I Associativity     | 2-way         |
| L2 Size                | 2 MB          |
| L2 Associativity       | 8-way         |

#### SPEC CPU 2006 - Benchmark results

| MinorCPU 1GHz            | Time (in ms) | CPI        | L1 D Cache Misses | L1 I Cache Misses | L2 Cache Misses |
| ------------------------ |--------------| ---------- | ------------------| ------------------| ----------------|
| 401.bzip2                | 161.025      | 1.610247   | 0.014675          | 0.000077          | 0.282157        |
| 429.mcf                  | 127.942      | 1.279422   | 0.002108          | 0.023627          | 0.055046        |
| 456.hmmer                | 118.530      | 1.185304   | 0.001629          | 0.000221          | 0.077747        |
| 458.sjeng                | 704.056      | 7.040561   | 0.121831          | 0.000020          | 0.999972        |
| 470.lbm                  | 262.327      | 2.623265   | 0.060971          | 0.000094          | 0.999944        |


| MinorCPU 2GHz            | Time (in ms) | CPI        | L1 D Cache Misses | L1 I Cache Misses | L2 Cache Misses |
| ------------------------ |--------------| ---------- | ------------------| ------------------| ----------------|
| 401.bzip2                | 83.982       | 1.679650   | 0.014798          | 0.000077          | 0.282163        |
| 429.mcf                  | 64.955       | 1.299095   | 0.002108          | 0.023612          | 0.055046        |
| 456.hmmer                | 59.396       | 1.187917   | 0.001637          | 0.000221          | 0.077760        |
| 458.sjeng                | 513.528      | 10.270554  | 0.121831          | 0.000020          | 0.999972        |
| 470.lbm                  | 174.671      | 3.493415   | 0.060972          | 0.000094          | 0.999944        |

#### System Domain and CPU-Cluster Clock Differences
The system domain clock sets the system uncore clock including the memory controller, the memory bus and the DVFS (Dynamic voltage and frequency scaling) handler, whereas the CPU-Cluster clock sets the cpu core clock including its computational units, the L1 Data and Instruction cache, the L2 cache and the walk cache. Should we add another cpu, its clock would be the CPU-Cluster clock.

#### Execution time scaling with clock rate
The execution time scales well with clock rate increase (almost 100% faster execution with double clock rate) only when the total cache miss rate is low. When an L2 cache miss occurs, the penalty of accessing the RAM through the memory controller and the memory bus has to be paid. This penalty is not affected by the CPU-Cluster clock rate and only depends on the System Domain clock and the RAM clock. This is made clear by our benchmark results above. The SPEC 401, 429 and 456 benchmarks scale almost perfectly, while the SPEC 458 and 470 benchmarks scale badly due to the L2 Cache Miss rate being almost 100%. We can also observe a CPI increase in cases when the scaling is bad. Since the cpu clock rate increases and the penalty time remains the same, there are more cycles wasted waiting for data to arrive from the memory.


### Stage two
All of the comparisons below are relative to the memory configuration of the first stage.

* #### 401.bzip2 (integer)
  We tried many different topologies, but none resulted in either better performance or less complexity.
![L1](/2nd_Lab_Data/stage_II_spec_results/charts/401.bzip2_l1.png)
![L2](/2nd_Lab_Data/stage_II_spec_results/charts/401.bzip2_l2.png)

* #### 429.mcf (integer)
  A 2.3% L1 instruction cache miss rate was noticed, so we doubled either its size or its associativity, both noticeably reducing the CPI and execution time to ~1.16 and ~57.8ms. We also implemented both of these changes, but no furthrer improvement was observed whatsoever.
A 5.5% L2 cache miss rate was noticed, but since we couldn't improve it, we settled up to reducing its size and associativity by 4 times and still getting the same performance.
Conclusion: This benchmark was instruction intensive.
![L1](/2nd_Lab_Data/stage_II_spec_results/charts/429.mcf_l1.png)
![L2](/2nd_Lab_Data/stage_II_spec_results/charts/429.mcf_l2.png)

* #### 456.hmmer (integer)
  We halved the L1 Data cache size since we noticed an almost 0% miss rate and managed to get the same performance. Regarding the L2 cache, we ended up reducing its size and associativity by 4 times leaving the performance unharmed.
![L1](/2nd_Lab_Data/stage_II_spec_results/charts/456.hmmer_l1.png)
![L2](/2nd_Lab_Data/stage_II_spec_results/charts/456.hmmer_l2.png)

* #### 458.sjeng (integer)
  The only parameter change that made a difference was the cache line size. Doubling it resulted in almost half the CPI and  execution time. Also, quadrupling it resulted in a minor impact to the CPI and execution time.
Regarding the L2 cache, its miss rate could not be helped, so we ended up reducing its size and associativity by 4 times leaving the performance unharmed.
Conclusion: This benchmark was designed to always miss in the L2 cache level.
![L1](/2nd_Lab_Data/stage_II_spec_results/charts/458.sjeng_l1.png)
![L2](/2nd_Lab_Data/stage_II_spec_results/charts/458.sjeng_l2.png)
![Line](/2nd_Lab_Data/stage_II_spec_results/charts/458.sjeng_line.png)

* #### 470.lbm (float)
  The only parameter change that made a difference was the cache line size. Doubling it resulted in a noticeable improvement of the CPI and  execution time. Also, quadrupling it made a less significant beneficial impact to the CPI and execution time.
Regarding the L2 cache, its miss rate could not be helped, so we ended up reducing its size and associativity by 4 times leaving the performance unharmed.
Conclusion: This benchmark was designed to always miss in the L2 cache level.
&nbsp;
![L1](/2nd_Lab_Data/stage_II_spec_results/charts/470.lbm_l1.png)
![L2](/2nd_Lab_Data/stage_II_spec_results/charts/470.lbm_l2.png)
![Line](/2nd_Lab_Data/stage_II_spec_results/charts/470.lbm_line.png)

### Sources
* http://gem5.org/
* https://www.spec.org/cpu2006/Docs/
