## Micro-benchmark

Benchmark for Cangjie language features and standard libraries, measures performance of APIs by time.
Compares Cangjie with Golang, and Cangjie with previous versions of itself.

### 1. Testlist

* `script/testlist` 

  * `testlist-cj-api, testlist-go-api` 

    Configure the list of Cangjie/Go APIs to be tested, the API in the list must be the same as the case directory name.

  * `testlist-cj-xxx, testlist-go-xxx`

    Configure the Benchmark of Cangjie/Go API, 'xxx' indicates the API name, the benchmark in 'testlist-cj-xxx' must be the same as the file name, while the benchmark in 'testlist-go-xxx' must be the same as the Benchmark function name. Please be sure to list the benchmark names in the correct format.

### 2. Run

* `auoto run` 

Run both cangjie and golang testcases:

``` cd script/run
cd script/run
python3 run_both.py
```

* `manual run` 

Run cangjie testcases:

``` 
cd script/run
bash set-up.sh
bash run-cj.sh xxx
```

Run golang  testcases:

``` 
cd script/run
bash set-up.sh
bash run-go.sh xxx
```

'xxx' refers to the API name.

### 3. Result

* `script/result` 


