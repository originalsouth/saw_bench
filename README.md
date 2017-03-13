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
rust: 8.20 (s)
c++: 6.43 (s)
emscripten/node (js): 16.34 (s)
julia: 288.30 (s)
python: 1018.51 (s)
awk (gawk): 695.86 (s)
php: 356.84 (s)
node (js): 26.44 (s)
```
