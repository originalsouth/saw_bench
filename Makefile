all: saw_rust saw_cc

benchmark: all benchmark_rust benchmark_cc benchmark_julia	benchmark_python benchmark_awk benchmark_php benchmark_js

benchmark_rust:
	time ./saw_rust > /dev/null

benchmark_cc:
	time ./saw_cc > /dev/null

benchmark_julia:
	time ./saw.jl > /dev/null

benchmark_python:
	time ./saw.py > /dev/null

benchmark_awk:
	time ./saw.awk > /dev/null

benchmark_php:
	time ./saw.php > /dev/null

benchmark_js:
	time ./saw.js > /dev/null

saw_rust: saw.rs
	rustc -C opt-level=3 -C lto -o saw_rust saw.rs

saw_cc: saw.cc
	g++ -Wall -Wextra -flto -O3 -o saw_cc saw.cc

clean:
	-rm -f saw_rust
	-rm -f saw_cc
