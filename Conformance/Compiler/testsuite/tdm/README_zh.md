# 测试与交付方法论

## 创建图表的前置条件
创建图表的前置条件是 `plotly.express` 和 `pandas` 包。可以通过以下命令安装：
```shell
pip3 install pandas plotly.express
```

## 内存测试的前置条件
```shell
pip3 install -U memory_profiler
```

## 按执行时间排序的测试图表
可以使用脚本 `plot_run_time.py` 创建一个按执行时间排序的测试图表。

首先，需要获取到 `results.log.json` 文件。
为了收集数据，可以使用 harness 测试框架运行测试套件中的测试用例：
```shell
python3 ../harness/harness.py --tests src/tests
```
  *注意:* `results.log.json` 文件将位于工作目录中。

最后，你可以创建一个按执行时间排序的测试图表：
```shell
python3 ./tdm/plot_run_time.py -i path2_results.log.json -o exec_time.html
```