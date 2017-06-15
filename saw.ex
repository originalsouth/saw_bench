#!/usr/bin/env elixir

defmodule Saw.Vars do
	@enforce_keys [:grid,:z,:rsq,:n]
	defstruct [:grid,:z,:rsq,:n]
end

defmodule Saw do
	def get(a, i, j) do
		Enum.at(Enum.at(a, i), j)
	end

	def set(a, i, j, newaij) do
		List.replace_at(a, i, List.replace_at(Enum.at(a, i), j, newaij))
	end


	def enablexy(vars, x, y) do
		%Saw.Vars{grid: set(vars.grid, x, y, true), z: vars.z, rsq: vars.rsq, n: vars.n}
	end

	def disablexy(vars, x, y) do
		%Saw.Vars{grid: set(vars.grid, x, y, false), z: vars.z, rsq: vars.rsq, n: vars.n}
	end

	def update_z_rsq(vars, x, y, nmax) do
		%Saw.Vars{grid: vars.grid, z: vars.z+1, rsq: vars.rsq + :math.pow(x-nmax,2) + :math.pow(y-nmax,2), n: vars.n}
	end

	def update_step(vars, x, y, ln, i, j, nmax) do 
		if !get(vars.grid,x+i,y+j) do
			mov(vars, x+i, y+j, ln+1, nmax)
		else
			vars
		end
	end

	def update_grid(vars, x, y, ln, nmax) do
		disablexy(update_step(update_step(update_step(update_step(enablexy(vars, x, y), x, y, ln,  1,  0, nmax), x, y, ln, -1,  0, nmax), x, y, ln,  0,  1, nmax), x, y, ln,  0, -1, nmax), x, y)
	end

	def mov(vars, x, y, ln, nmax) do 
		if ln == vars.n do
			update_z_rsq(vars, x, y, nmax)
		else
			update_grid(vars, x, y, ln, nmax)
		end
	end
end

defmodule Main do
  def main do
    nmax = 20
	results = Enum.map(0..nmax-1, fn (n) -> Saw.mov(%Saw.Vars{grid: Enum.map(0..(2*nmax), fn (_x) -> Enum.map(0..(2*nmax), fn (_x) -> false end) end), z: 0, rsq: 0, n: n}, nmax, nmax, 0, nmax) end)
	report = Enum.join(Enum.map(results, fn(vars) -> "n=" <> Integer.to_string(vars.n) <> " z=" <> Integer.to_string(vars.z) <> " rsq/z=" <> Float.to_string(vars.rsq/vars.z) end), "\n")
	IO.puts(report)
  end
end

Main.main
