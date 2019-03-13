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
Running this on a `Intel(R) Core(TM) M-5Y10c CPU @ 0.80GHz` with an up to date `5.0.0-arch1-1-ARCH` we find:
```
c (gcc): 6.26s
c++ (gcc): 6.55s
c (clang): 6.98s
c++ (clang): 7.11s
rust: 7.92s
fortran90 (gcc): 8.24s
emcc/js (node): 8.68s
julia (optimized): 9.44s
em++/js (node): 11.56s
node (js): 32.95s
julia: 216.54s
php: 244.90s
lua: 375.86s
awk (gawk): 732.79s
python: 862.74s
Rscript: 1898.63s
elixir: 2366.36s
```
