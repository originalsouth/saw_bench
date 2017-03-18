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
Running this on a Intel(R) Core(TM) M-5Y10c CPU @ 0.80GHz we find:
```
rust: 7.99s
c: 6.12s
c++: 6.26s
emcc/js (node): 12.02s
em++/js (node): 15.51s
julia: 16.79s
python: 984.79s
awk (gawk): 696.58s
php: 362.15s
node (js): 26.66s
```
