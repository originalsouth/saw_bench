all: saw_rust saw_f90 saw_c saw_cc saw_em_c.js saw_em_cc.js

benchmark: all benchmark_rust benchmark_f90 benchmark_c benchmark_cc benchmark_emjs_c benchmark_emjs_cc benchmark_julia benchmark_julia_opt benchmark_python benchmark_awk benchmark_php benchmark_js benchmark_elixir benchmark_lua benchmark_R

benchmark_rust:
	@./timer.sh rust ./saw_rust

benchmark_f90:
	@./timer.sh fortran90 ./saw_f90

benchmark_c:
	@./timer.sh c ./saw_c

benchmark_cc:
	@./timer.sh c++ ./saw_cc

benchmark_emjs_c:
	@./timer.sh 'emcc/js (node)' './saw_em_c.js'

benchmark_emjs_cc:
	@./timer.sh 'em++/js (node)' './saw_em_cc.js'

benchmark_julia:
	@./timer.sh julia './saw.jl'

benchmark_julia_opt:
	@./timer.sh 'julia (optimized)' './saw_opt.jl'

benchmark_python:
	@./timer.sh python './saw.py'

benchmark_awk:
	@./timer.sh 'awk (gawk)' './saw.awk'

benchmark_php:
	@./timer.sh php './saw.php'

benchmark_js:
	@./timer.sh 'node (js)' './saw.js'

benchmark_elixir:
	@./timer.sh elixir './saw.ex'

benchmark_lua:
	@./timer.sh lua './saw.lua'

benchmark_R:
	@./timer.sh Rscript './saw.r'

saw_rust: saw.rs
	rustc -C opt-level=3 -C lto -o saw_rust saw.rs

saw_f90: saw.f90
	gfortran -Wall -Wextra -flto -O3 -o saw_f90 saw.f90

saw_c: saw.c
	gcc -Wall -Wextra -std=c11 -flto -O3 -o saw_c saw.c

saw_em_c.js: saw.c
	emcc -Wall -Wextra -std=c11 -flto -O3 -o saw_em_c.js saw.c
	@sed -i "1i #!/usr/bin/env node" saw_em_c.js
	@chmod u+x saw_em_c.js

saw_cc: saw.cc
	g++ -Wall -Wextra -std=c++11 -flto -O3 -o saw_cc saw.cc

saw_em_cc.js: saw.cc
	em++ -Wall -Wextra -std=c++11 -flto -O3 -o saw_em_cc.js saw.cc
	@sed -i "1i #!/usr/bin/env node" saw_em_cc.js
	@chmod u+x saw_em_cc.js

clean:
	-rm -f saw_rust
	-rm -f saw_f90
	-rm -f saw_c
	-rm -f saw_cc
	-rm -f saw_em_c.js*
	-rm -f saw_em_cc.js*
