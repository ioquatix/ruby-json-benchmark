# JSON Benchmark

Compare the performance of different JSON libraries, including the standard library `json`, `oj` and `yajl-ruby`.

## Usage

```
> bundle install
> bundle exec bake benchmark_load
> bundle exec bake benchmark_dump
```

## Results

`Oj` is a clear winner in all benchmarks. `Yajl` is faster than `json` in the `dump` benchmark, but slower in the `load` benchmark. It looks like `fast_generate` is slower in all cases.

```
> cat /proc/cpuinfo | head -n 5 | tail -n 1
model name	: AMD Ryzen 9 7950X 16-Core Processor

```

### Benchmark Dump

```
> bake benchmark_dump
Warming up --------------------------------------
         yajl encode    19.232k i/100ms
             oj dump    47.060k i/100ms
       json generate    18.330k i/100ms
           json dump    17.046k i/100ms
  json fast_generate    16.778k i/100ms
Calculating -------------------------------------
         yajl encode    188.221k (± 1.9%) i/s -    942.368k in   5.008597s
             oj dump    472.239k (± 1.7%) i/s -      2.400M in   5.083894s
       json generate    182.179k (± 0.8%) i/s -    916.500k in   5.031054s
           json dump    174.189k (± 1.0%) i/s -    886.392k in   5.089150s
  json fast_generate    168.493k (± 0.3%) i/s -    855.678k in   5.078480s

Comparison:
             oj dump:   472239.4 i/s
         yajl encode:   188221.5 i/s - 2.51x  slower
       json generate:   182178.9 i/s - 2.59x  slower
           json dump:   174189.3 i/s - 2.71x  slower
  json fast_generate:   168492.8 i/s - 2.80x  slower
```

### Benchmark Load

```
> bake benchmark_load
Warming up --------------------------------------
         yajl parser     5.547k i/100ms
           oj parser    10.946k i/100ms
         json parser     9.521k i/100ms
Calculating -------------------------------------
         yajl parser     53.133k (± 0.6%) i/s -    266.256k in   5.011263s
           oj parser    111.790k (± 0.4%) i/s -    569.192k in   5.091719s
         json parser     96.673k (± 1.4%) i/s -    485.571k in   5.023759s

Comparison:
           oj parser:   111789.7 i/s
         json parser:    96673.4 i/s - 1.16x  slower
         yajl parser:    53133.4 i/s - 2.10x  slower
```
