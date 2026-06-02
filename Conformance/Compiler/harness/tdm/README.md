# Testing and Delivering Methodology 
 
## Prerequisites for Creating Charts
Prerequisites for creating charts are `plotly.express` and `pandas` packages. They can be installed by commands:
```shell
pip3 install pandas plotly.express
```
 
## Chart Memory Usage and Process Count During Concurrent Execution
You can create memory usage chart of tests run by script `plot_mem_usage.py`
 
First of all you should collect memory usage data with `memory_profile`.
To collect data you can use following command:
```shell
mprof run -o mprofile.out --include-children ./harness.py --test-root ../test_suite/ --log-mode progress
```
  *Note:* the `memory_profile` doesn't overwrite output file, so to get correct chart you should use different output files or remove results of previous run.
 
And at the end you can create chart of memory usage:
```shell
python3 ./tdm/plot_mem_usage.py -i mprofile.out -o mem_usage.html
```
Also you can create chart with using multiple input data. For example if you have two profiles for 8 and 16 threads:
```shell
python3 ./tdm/plot_mem_usage.py -i mprofile_8threads.out -i mprofile_16threads.out -o mem_usage_8_16_threads.html
```
  *Note:* the `memory_profile` can be installed by pip:
  ```
  pip3 install -U memory_profiler
  ```
## Gantt Chart of Piping Tests Compilation and Execution
You can create Gantt chart of piping tests compilation and execution by script `plot_gantt.py`
 
First of all you should collect necessary data by adding option `--profile` for `harness.py` command.
 
Example of usage:
```shell
python3 ./tdm/plot_gantt.py -i ./work/results.log.json -o ./gantt.html
```