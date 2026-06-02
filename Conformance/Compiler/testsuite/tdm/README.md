# Testing and Delivering Methodology 
 
## Prerequisites for Creating Charts
Prerequisites for creating charts are `plotly.express` and `pandas` packages. They can be installed by commands:
```shell
pip3 install pandas plotly.express
```
 
## Prerequisites for Memory Test
```shell
pip3 install -U memory_profiler
```
 
## Chart with Tests Sorted by Execution Time
You can create chart with tests sorted by execution time with script `plot_run_time.py`
 
First of all you should get your `results.log.json` file.
To collect data you can run test cases from TEST SUITE with harness:
```shell
python3 ../harness/harness.py --tests src/tests
```
  *Note:* the `results.log.json` file will be in work directory
 
And at the end you can create chart with tests sorted by execution time:
```shell
python3 ./tdm/plot_run_time.py -i path2_results.log.json -o exec_time.html
```