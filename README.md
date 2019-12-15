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
  A 2.3% L1 instruction cache miss rate was noticed, so we doubled either its size or its associativity, both noticeably reducing the CPI and execution time to ~1.16 and ~57.8ms. We also implemented both of these changes, but no furthrer improvement was observed whatsoever.  A 5.5% L2 cache miss rate was noticed, but since we couldn't improve it, we settled up to reducing its size and associativity by 4 times and still getting the same performance.  Conclusion: This benchmark was instruction intensive.  
![L1](/2nd_Lab_Data/stage_II_spec_results/charts/429.mcf_l1.png)
![L2](/2nd_Lab_Data/stage_II_spec_results/charts/429.mcf_l2.png)

* #### 456.hmmer (integer)
  We halved the L1 Data cache size since we noticed an almost 0% miss rate and managed to get the same performance. Regarding the L2 cache, we ended up reducing its size and associativity by 4 times leaving the performance unharmed.  
![L1](/2nd_Lab_Data/stage_II_spec_results/charts/456.hmmer_l1.png)
![L2](/2nd_Lab_Data/stage_II_spec_results/charts/456.hmmer_l2.png)

* #### 458.sjeng (integer)
  The only parameter change that made a difference was the cache line size. Doubling it resulted in almost half the CPI and  execution time. Also, quadrupling it resulted in a minor impact to the CPI and execution time.  Regarding the L2 cache, its miss rate could not be helped, so we ended up reducing its size and associativity by 4 times leaving the performance unharmed.  Conclusion: This benchmark was designed to always miss in the L2 cache level.  
![L1](/2nd_Lab_Data/stage_II_spec_results/charts/458.sjeng_l1.png)
![L2](/2nd_Lab_Data/stage_II_spec_results/charts/458.sjeng_l2.png)
![Line](/2nd_Lab_Data/stage_II_spec_results/charts/458.sjeng_line.png)

* #### 470.lbm (float)
  The only parameter change that made a difference was the cache line size. Doubling it resulted in a noticeable improvement of the CPI and  execution time. Also, quadrupling it made a less significant beneficial impact to the CPI and execution time.  Regarding the L2 cache, its miss rate could not be helped, so we ended up reducing its size and associativity by 4 times leaving the performance unharmed.  Conclusion: This benchmark was designed to always miss in the L2 cache level.  
![L1](/2nd_Lab_Data/stage_II_spec_results/charts/470.lbm_l1.png)
![L2](/2nd_Lab_Data/stage_II_spec_results/charts/470.lbm_l2.png)
![Line](/2nd_Lab_Data/stage_II_spec_results/charts/470.lbm_line.png)

### Stage three

#### Cost Function
We came up with this cost function: __{n1/8kB + (k1D+k1I)^1.4 + n2/256kB + k2^1.4 + c/8B}__ where n1 represents the L1 Cache Size, k1D the L1 Data Cache Associativity, k1I the L1 Instruction Cache Associativity, n2 the L2 Cache Size, k2 the L2 Cache Associativity and c the Cache Line Size.  
We chose this function for the following reasons:
* The L1 cache is more expensive per kB than the L2 cache. This is modeled by the different constants multiplied with the sizes. For instance, 64kB of L1 Cache and 2MB of L2 Cache cost the same.
* The cost of higher associativity is modeled by its value raised to the power 1.4 for complexity reasons eg 2->4 way is more simple than 4->8 way and their cost relation is not linear, but still smaller than squared.
* The cache line size costs a lot per byte, because an increased size leads to more words being saved into the same block/line, resulting in more comparisons (more expensive multiplexer) to find the desired one. What's more, the number of blocks/lines in the cache is reduced and conflict misses may increase in case spacial locality is not present.
* We couldn't determine what costs more: A doubling in size or associativity? eg L1 32kB 4-way vs L1 64kB 2-way.

#### Cost Function Application
* #### 401.bzip2
  For this benchmark, we decided that the most effiecient configuration would be a small L2 cache (512kB) with little associativity (4-way, maybe less, didn't have the time to test) and a 64kB L1 2-way cache, because the performance increase for a bigger cache (2MB) and/or higher associativity (8-way) would be less than 5% and for a bigger L1 cache (128kB) and/or higher associativity (8-way) would be less than 3%, while the cost for the L2 cache is more than quadrupled and for the L1 cache more than doubled. We also did a test for increased cache line size (64B->128B) and noticed worse performance, so we obviously prefer the default 64B size.
* #### 429.mcf
  This benchmark doesn't scale with L2 cache at all, so we choose the most simple one (512kB 4-way, maybe even less associativity). Otherwise, the cost would increase with no performance gain. About the L1 cache, we tested the instruction one and witnessed a significant performance increase for a little bigger or more complex cache. We choose the 64kB 2-way instead of the 32kB 4-way because it costs less according to our cost function.
* #### 456.hmmer
  This benchmark doesn't scale with L2 cache at all, so we choose the most simple one (512kB 4-way, maybe even less associativity). Otherwise, the cost would increase with no performance gain. About the L1 data cache, we choose the decreased size of 32kB 2-way, because the performance hit compared to 64kB 2-way is less than 1%, compared to a double cost for the L1 data cache. The 64kB 1-way has about the same cost with the 32k 2-way, but results in even worse performance.
* #### 458.sjeng
  This benchmark doesn't scale at all with L1 and L2 cache, so we choose the smaller and simplest for the ones we tested. On the other hand, it scales a lot with cache line size increase. The total cost increase for a doubled cache line size is 40% giving a performance gain of 34%, while for a quadrupled cache line size is 87% giving a performance gain of 50%. We believe that this cost increase justifies the extra cost.
* #### 470.lbm
  The optimal is the same with the one from 458.sjeng.

#### Lab Assignment Review (in greek)
Η δεύτερη εργασία μας φάνηκε αρκετά πιο απαιτητική από την πρώτη, ωστόσο μας βοήθησε να καταλάβουμε εις βάθος το σύστημα κρυφών μνημών και το ρόλο της κάθε παραμέτρου. Ειδικά το κομμάτι με την εξίσωση κόστους ήταν χρονοβόρο, αν και βοήθησε στην κατανόηση λεπτομερειών που δε χρειάστηκε να σκεφτούμε στο προηγούμενο κομμάτι. 

### Sources
* http://gem5.org/
* https://www.spec.org/cpu2006/Docs/
* https://www.d.umn.edu/~gshute/arch/cache-addressing.xhtml
* https://cseweb.ucsd.edu/classes/su07/cse141/cache-handout.pdf


## 3rd Lab

### Stage one

#### Answer 1
Power dissipation in a circuit comes in two forms: dynamic and static. Dynamic power is primarily caused by current flow from the charging and discharging of parasitic capacitances. Dynamic power is proportional to these capacitances, the clocking frequency and the supply voltage.  
Static power, on the other hand, is caused by leakage currents while gates are idle. Static leakage loss increases as process geometry decreases, but for a certain lithography supply voltage as well as temperature can also play a major role. Leakage power is now becoming proportional to dynamic power loss in 90nm and below.  
Should two different programms run individually, only the dynamic power dissipation will be affected (no power gating is applied) and the one causing the most flip-flop state changes will result in higher dynamic power dissipation. Should power gating be applied, then leakage power could also be affected depending on which CPU parts will be used. Well, to be precise, since leakage power is also dependant on the operating temperature, when a program runs and increases the dynamic power dissipation, the operating temperature rises thus increasing the leakage power loss.  
Time duration does not matter, since the consumption numbers McPAT generates refer to power (Watts), not power consumption (Watt hours).

#### Answer 2
Yes, there is a chance that processor B could be more energy efficient than processor A, since energy effiency is defined by both idle_power_consumption*idle_time + work_power_consumption*work_time.  
McPAT results can't answer the question, because we are missing the work_time and idle_time. Both of these parameters can be given by a gem5 simulation.

#### Answer 3
The Xeon processor can't be more energy efficient than the ARM A9 processor for the following reason: let's say we have two systems, one with the Xeon and another with the ARM A9. The Xeon system is 40 times faster than the ARM A9 system. Both systems power on at the same time and start executing the same program. Let's say the program runs for 1 hour on the Xeon system, so for 40 hours on the ARM A9 system according to our previous assumption. The Xeon system consumes ... watts when working, so ... Wh till program finishes its execution, while the ARM A9 system consumes ... watts when working, so ... * 40 hours = ... Wh till program finishes its execution. Should both systems power off when the execution finishes, the ARM A9 is obviously more energy efficient since it consumed less power. But, even if the Xeon had consumed less power till execution finished, should the systems stay powered on and idle, at a certain moment the ARM A9 system would surpass the Xeon one, because of its lower idle energy power consumption (mainly defined be the leakage power loss if we assume the dynamic power dissipation is minor). 

### Sources
* https://www.eetimes.com/a-methodology-for-minimizing-leakage-current/
* https://www.eetimes.com/solve-leakage-and-dynamic-power-loss/
