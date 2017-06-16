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
Make sure Rust, gcc, Julia, python, gawk, php, nodejs and emscripten are installed and just run:
```
make benchmark
```

### Results
Running this on a Intel(R) Xeon(R) CPU E5-2690 0 @ 2.90GHz we find:
```
rust: 4.68s
fortran90: 4.34s
c: 4.18s
c++: 4.02s
emcc/js (node): 6.88s
em++/js (node): 9.07s
julia: 9.21s
python: 694.97s
awk (gawk): 518.20s
php: 233.37s
node (js): 23.07s
elixir: 1379.60s
```
