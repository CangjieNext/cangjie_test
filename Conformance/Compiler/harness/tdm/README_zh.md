# 测试与交付方法论

## 创建图表的前置条件
创建图表的前置条件是 `plotly.express` 和 `pandas` 包。可以通过以下命令安装：
```shell
pip3 install pandas plotly.express
```

## 同时运行的图表内存使用情况和进程计数
可以通过脚本 `plot_mem_usage.py` 创建测试运行的内存使用图表。

首先，需要使用 `memory_profile` 收集内存使用数据。
收集数据可以使用以下命令：
```shell
mprof run -o mprofile.out --include-children ./harness.py --test-root ../test_suite/ --log-mode progress
```
  *注意:* `memory_profile` 不会覆盖输出文件，因此为了获得正确的图表，应该使用不同的输出文件或删除之前运行的结果。

最后，你可以创建内存使用图表：
```shell
python3 ./tdm/plot_mem_usage.py -i mprofile.out -o mem_usage.html
```
你也可以使用多个输入数据创建图表。例如，如果有两个针对8线程和16线程的配置文件：
```shell
python3 ./tdm/plot_mem_usage.py -i mprofile_8threads.out -i mprofile_16threads.out -o mem_usage_8_16_threads.html
```
  *注意:* `memory_profile` 可以通过 pip 安装：
  ```
  pip3 install -U memory_profiler
  ```
## 管道测试编译和执行的甘特（Gantt）图
可以通过脚本 `plot_gantt.py` 创建管道测试编译和执行的甘特图。

首先，需要通过为 `harness.py` 命令添加选项 `--profile` 来收集必要的数据。

再运行如下示例：
```shell
python3 ./tdm/plot_gantt.py -i ./work/results.log.json -o ./gantt.html
```