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
