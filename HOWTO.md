# How-To

```bash
> brew install boost
> patch: include/write_common.hpp:30 entfernen
> CXX=clang++ BOOST_INCLUDE_PATH=/usr/local/include/boost rake

> ./tools/make_data.rb

> ./tools/test_read.sh
> cat /Users/lukas/Documents/src/io_benchmark/results/read_results.csv | grep -v '^File' | sed -e 's/ \([0-9]*\) KB,/, \1,/' -e 's/\(mmap_[a-z]*\),/\1, 0,/' > strudel_read_1-256_20190730.csv
```
