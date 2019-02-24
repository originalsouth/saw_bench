# saw_bench
Benchmark a bunch of programming languages by enumerating self avoiding random walks.

```
/* By BC van Zuiden -- Leiden, November 2016 */
/* Probably very buggy USE AT OWN RISK this will brick everything you own */
/* NOBODY but YOU is liable for anything that happened in result of using this */
/* WARNING: DON'T RUN THIS PROGRAM THIS WILL DESTROY YOUR COMPUTER AND/OR HOUSE */
/* Any copyrighted piece of code within this code is NOT mine */
/* Inclusion of that code is forced upon me by a scary anonymous guy with a gun*/
/* https://github.com/originalsouth/saw_bench */
```

###
Compares runtimes the same recursive algorithm for self avoiding random walks 

Feel free to reuse and contribute, pull requests are very welcome!
This code is (and forever will be) a work in progress.

### Usage
Make sure Rust, gcc, fortran90, Julia, python, gawk, php, nodejs, emscripten, elixir, lua and R are installed and just run:
```
make benchmark | sort -t: -k 2 -h
```

### Results
Running this on a `Intel(R) Core(TM) M-5Y10c CPU @ 0.80GHz` with an up to date `4.20.11-arch1-1-ARCH` we find:
```
c: 6.13s
c++: 6.40s
rust: 7.69s
fortran90: 8.01s
emcc/js (node): 8.47s
julia (optimized): 9.12s
em++/js (node): 11.29s
node (js): 34.35s
php: 233.73s
julia: 243.69s
lua: 357.70s
awk (gawk): 716.22s
python: 840.96s
Rscript: 1780.09s
elixir: 2222.39s
```
