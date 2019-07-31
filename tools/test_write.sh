#! /usr/bin/env bash

sizes_kb=(1 2 4 8 16 24 32 40 48 56 64 80 96 112 128 160 192 224 256 320 384 448 512 640 768 896 1024)
sizes_mb=(1 2 4 8 16 32 64 80 96 112 256)

function test() {
	local unit=$1
	shift 1
	local sizes=$@

	if [ "$unit" = "kb" ]; then
		let unit_size=2**10
	else
		let unit_size=2**20
	fi

	for s in $sizes; do
		local suffix="${s}_${unit}"
		./out/write_benchmark.run $[s * unit_size] | tee results/write_${suffix}.csv
	done
#	cat results/read_*_${unit}.csv > results/read_results_${unit}.csv
}

test kb ${sizes_kb[*]}
test mb ${sizes_mb[*]}

