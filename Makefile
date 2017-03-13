all: saw_rust saw_cc saw_em.js

benchmark: all benchmark_rust benchmark_cc benchmark_emjs benchmark_julia	benchmark_python benchmark_awk benchmark_php benchmark_js 
benchmark_rust:
	@./timer.sh rust ./saw_rust

benchmark_cc:
	@./timer.sh c++ ./saw_cc

benchmark_emjs:
	@./timer.sh 'emscripten/node (js)' './saw_em.js'

benchmark_julia:
	@./timer.sh julia './saw.jl'

benchmark_python:
	@./timer.sh python './saw.py'

benchmark_awk:
	@./timer.sh 'awk (gawk)' './saw.awk'

benchmark_php:
	@./timer.sh php './saw.php'

benchmark_js:
	@./timer.sh 'node (js)' './saw.js'

saw_rust: saw.rs
	rustc -C opt-level=3 -C lto -o saw_rust saw.rs

saw_cc: saw.cc
	g++ -Wall -Wextra -std=c++11 -flto -O3 -o saw_cc saw.cc

saw_em.js: saw.cc
	em++ -Wall -Wextra -std=c++11 -flto -O3 -o saw_em.js saw.cc
	@sed -i "1i #!/usr/bin/env node" saw_em.js
	@chmod u+x saw_em.js

clean:
	-rm -f saw_rust
	-rm -f saw_cc
	-rm -f saw_em.js*
