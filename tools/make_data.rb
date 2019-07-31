#! /usr/bin/env ruby

def make_test_files_mb()
	block_size = 64 * 2**10
	[1, 2, 4, 8, 16, 24, 32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256,
	320, 384, 448, 512, 640, 768, 896, 1024].each do |i|
		file_size = i * 2**20
		count = file_size / block_size
		puts "Creating #{i} MB test file."
		`dd if=/dev/urandom of=data/test_#{i}_mb.bin bs=#{block_size} count=#{count}`
	end
end

def make_test_files_kb()
	block_size = 1 * 2**10
	[1, 2, 4, 8, 16, 24, 32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256,
	320, 384, 448, 512, 640, 768, 896].each do |i|
		file_size = i * 2**10
		count = file_size / block_size
		puts "Creating #{i} KB test file."
		`dd if=/dev/urandom of=data/test_#{i}_kb.bin bs=#{block_size} count=#{count}`
	end
end

make_test_files_kb()
make_test_files_mb()
