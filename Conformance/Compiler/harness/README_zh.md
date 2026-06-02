# Harness 测试框架

Harness 提供自动化测试流程，支持运行仓颉测试并生成测试报告。 

Harness 专为仓颉语言测试而开发，但可被改造并应用于其他编程语言及测试场景。

执行脚本位于根目录下，命名为 `harness.py`。

## 目录结构 
```shell
harness/
|-- README.md    测试框架说明文档
|-- base-settings.json    默认配置文件
|-- core    核心模块
|   |-- __init__.py
|   |-- config.py    测试框架配置类
|   |-- config_manager.py    处理配置的加载/保存和获取/设置操作
|   |-- driver_list.py    注册所有驱动程序并设置默认驱动
|   |-- driver_manager.py    驱动程序处理与生命周期管理
|   |-- report_manager.py    报告生成与日志管理
|   `-- task_manager.py    测试发现与驱动调度
|-- demo    示例代码
|-- diff    差异比较模块
|   |-- __init__.py
|   |-- diff_template
|   |   `-- diff_template.html    HTML差异报告模板
|   |-- html_diff.py    生成HTML格式的测试报告差异
|   `-- plain_text_diff.py    生成纯文本格式的测试报告差异
|-- drivers    驱动模块
|   |-- __init__.py
|   |-- runner
|   |   |-- __init__.py
|   |   |-- base_runner.py    运行器基类实现
|   |   |-- lang_runner.py    语言测试编译与执行驱动
|   |   `-- simple_py_runner.py    简化的Python脚本执行驱动
|   `-- test
|       |-- __init__.py
|       |-- base_test.py    测试用例基类
|       |-- fake_test.py    模拟测试类
|       `-- test.py
|-- excluded.lst    屏蔽列表样例
|-- harness.py    Harness 测试框架执行脚本
|-- included.lst    包含列表样例
|-- report.py    报告生成执行脚本
|-- reporter    报告生成模块
|   |-- __init__.py
|   |-- html_reporter.py    生成HTML格式测试报告
|   |-- junit_reporter.py    生成JUnit格式测试报告
|   |-- plain_text_reporter.py    生成纯文本格式测试报告
|   |-- report_template
|   |   `-- report_template.html    HTML报告模板文件
|   `-- tree_view.pyl    树形结构处理类及操作方法
|-- run_diff.py    报告对比执行脚本
|-- sample_tests    一些样例
|-- tdm    tdm模块
|   |-- README.md    tdm模块说明文档
|   |-- accept.py
|   |-- plot_gantt.py    创建管道测试编译和执行的甘特图
|   |-- plot_mem_usage.py    创建测试运行的内存使用图表
|   `-- tests
|-- tests    测试模块
|   |-- __init__.py
|   |-- config_tests.py    Config类单元测试
|   |-- driver_tests.py    DriverManager类单元测试
|   |-- resources
|   |-- simple_py_runner_tests.py    SimplePyRunner类单元测试
|   |-- test_tests.py    Test类单元测试
|   `-- utils_tests.py    核心工具函数单元测试
`-- utils    工具模块
    |-- __init__.py
    |-- utils.py    实用工具函数集合
    |-- version.py
    `-- win_killpg.py    Windows平台进程组终止工具
```

## 运行要求

- Python 3.6+

## 测试套创建和配置

### 配置文件

您可以在 `base-settings.json` 配置文件中配置您的测试套件运行的参数。  
如果需要更改特定 Harness 运行的某些参数（例如，如果需要获取更详细的日志文件），则可以在命令行中设置输入 Harness 参数，它将覆盖配置文件中的相同参数。  
请参阅 Harness 命令行选项一章，以获取有关支持的 Harness 选项的更多信息。  
下面是一个示例，如 `base-settings.json` 文件具有默认值：
```json
{
    "work_directory": "work",
    "binary_output_path": "bin",
    "test_run_output_path": "test_res",
    "cj": "cj",
    "cjc": "cjc",
    "cc": "clang",
    "cxx": "clang++",
    "java": "java",
    "javac": "javac",
    "tests_root_path": "../test_suite",
    "tests": [],
    "run_mode": "mixed",
    "cj_flags": "",
    "cjc_flags": "",
    "cc_flags": "",
    "cxx_flags": "",
    "java_flags": "",
    "javac_flags": "",
    "compilation_threads": 4,
    "execution_threads": 4,
    "base_timeout": 30,
    "is_jet": false, 
    "filters": [],
    "excluded_tests_list": "excluded.lst",
    "included_tests_list": "included.lst",
    "test_report_mode": "plain",
    "log_file": "results.log",
    "log_mode": "detailed",
    "log_no_color": false
}
```

### 创建测试套

通常，测试套件根目录包含以下内容：
* 带有测试套件简要说明的 `README.md` 文件
* `src` 文件夹，包含测试源文件

`src` 文件夹中的测试可以具有任意深度的分层目录结构，例如每个子目录包含一个规范断言或一个测试相关的文件。Harness 将搜索整个目录树并收集单个测试用例。

Harness 会将名称以 `test` 字符串开头并以 `.cj` 扩展名结尾的任何文件识别为测试用例。每个子目录中可以存放任何必要的辅助文件。  
请注意，即使文件名包含 `test` 子字符串，如果此类测试出现在给定运行的 Harness 参数中指定的排除列表中，或者与 `--tests` 选项提供的给定掩码不匹配，则 Harness 也可以在测试套件执行期间跳过此测试。  
通常，测试套件还可以包含大多数测试使用的公用实用程序（例如，`src/utils` 目录）。

### 编写测试

每个测试源文件都在上面的注释部分中包含一个特殊的标题，其中的注释描述了它的目的、使用场景和主要的测试属性，通过特殊格式的标记指定测试属性。  
根据标签的值：
* 决定了测试框架如何编译和执行测试
* 根据实际的测试编译和执行结果，决定应该报告哪个执行状态

测试文件应该是一个包含 `main()` 的文件，它的名称应该以 `test` 前缀开头。此外，测试可以有多个文件，例如测试包导入场景。这样的辅助文件名不应该以 `test` 字符串开头。

测试用例示例：testsuite/src/tests/01_lexical_structure/01_identifiers_and_keywords/a02/test_a02_01.cj
```cangjie
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_01_a02_01

  @Level:         1

  @Assertion:    1.1(2) There are two kinds of of identifiers: ordinary
                 identifiers and raw identifiers.

  @Description:  Check both kinds of identifier in the same function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
    var a1: Int64 = 1
    var a2: Int64 = 2
    var `aa1`: Int64 = 22
    var `aa2`: Int64 = 33
    func `f`() { 0 }
    Assert.equals(1, a1);
    Assert.equals(2, a2);
    Assert.equals(22, `aa1`);
    Assert.equals(33, `aa2`);
    Assert.equals(0, `f`());
}
```

这个测试用例执行模式是运行，意味着 Harness 将编译这个测试用例，然后运行编译后的二进制产物。因此，这个测试用例必须成功编译，否则测试将失败。当测试执行结束后，Harness 将分析其退出码并对测试结果做出决定。

#### 用例标签

基础标签:

* `@Name` - 编译后的可执行文件名（默认情况下为不带扩展名的测试文件名）
* `@Mode (Run/Compileonly)` - 测试执行模式（默认情况下为 Run）
* `@Negative (Yes/No)` - 测试用例是否为负面测试（默认情况下为 No）
* `@CompileWarning (No/Yes/Ignore)` - 是否预期编译警告
* `@Replay` - 表示测试是非确定性的
* `@MacroLib` - 表示文件是否为宏包
* `@AutoDiff` - 标记必须启用自动微分的测试
* `@ExpectTimeout` - 是否预期测试可执行文件会挂起
* `@TimeoutFactor` - 测试的超时因子
* `@Assertion` - 与测试对应的断言的标识符和文本
* `@Description` - 作为断言一部分的测试描述
* `@Comment` - 可选的注释
* `@Issue` - 如果测试曾因该错误失败，相关的仓颉编译器错误编号

## 运行说明

可以用如下命令运行所有示例用例：
```shell
python3 ./harness.py --work-dir ./work --test-root ./demo --log-mode verbose --base-timeout 30 --tests demo/src/doc
```

参数说明：指定参数会覆盖框架配置文件中的设置
```shell
usage: harness.py [--bin-output BIN_OUTPUT] [--config-file CONFIG_FILE] [--cj CJ] [--cjc CJC] [--cc CC] [--cxx CXX] [--java JAVA] [--javac JAVAC] [--test-output TEST_OUTPUT] [--test-root TEST_ROOT]
                  [--tests TESTS [TESTS ...]] [--work-dir WORK_DIR] [--level LEVEL] [--run-mode {compile,execute,mixed}] [--replay] [--base-timeout BASE_TIMEOUT] [--cj-flags CJ_FLAGS] [--cjc-flags CJC_FLAGS]
                  [--cc-flags CC_FLAGS] [--cxx-flags CXX_FLAGS] [--java-flags JAVA_FLAGS] [--javac-flags JAVAC_FLAGS] [--comp-threads COMPILATION_THREADS] [--exec-threads EXECUTION_THREADS]
                  [--included-tests INCLUDED_TESTS_LIST] [--excluded-tests EXCLUDED_TESTS_LIST] [--jet] [--filters FILTERS] [--report-mode {plain,junit,html}] [--log-file LOG_FILE]
                  [--log-mode {progress,short,detailed,verbose}] [--no-color] [--debug] [--clean] [--yes] [--help] [--version]

Harness for Cangjie language

general arguments:
  --bin-output BIN_OUTPUT
                        Path to output of compilation results
  --config-file CONFIG_FILE
                        Path to custom config file
  --cj CJ               Path to Cangjie VM
  --cjc CJC             Path to Cangjie compiler
  --cc CC               Path to C compiler
  --cxx CXX             Path to C++ compiler
  --java JAVA           Path to Java VM
  --javac JAVAC         Path to Javac compiler
  --test-output TEST_OUTPUT
                        Path for artifacts form tests execution
  --test-root TEST_ROOT
                        Path to root directory with tests
  --tests TESTS [TESTS ...]
                        Path to specific folder with tests or test file
  --work-dir WORK_DIR   Path to work directory
  --level LEVEL         Input level for run, default empty.

execution arguments:
  --run-mode {compile,execute,mixed}
                        Set one of the modes:
                                compile only
                                execution only
                                mixed mode (default)
  --replay              Enable replay mode
  --base-timeout BASE_TIMEOUT
                        Base timeout which used for compilation and execution each test
  --cj-flags CJ_FLAGS   Additional options for Cangjie VM
  --cjc-flags CJC_FLAGS
                        Additional options for Cangjie compiler
  --cc-flags CC_FLAGS   Additional options for C compiler
  --cxx-flags CXX_FLAGS
                        Additional options for C++ compiler
  --java-flags JAVA_FLAGS
                        Additional options for Java VM
  --javac-flags JAVAC_FLAGS
                        Additional options for Javac compiler
  --comp-threads COMPILATION_THREADS
                        Threads used for tests compilation
  --exec-threads EXECUTION_THREADS
                        Threads used for tests execution
  --included-tests INCLUDED_TESTS_LIST
                        Included tests list path
  --excluded-tests EXCLUDED_TESTS_LIST
                        Excluded tests list path
  --jet                 Specify this flag if the jet compiler is being tested
  --filters FILTERS     Test filters

report arguments:
  --report-mode {plain,junit,html}
                        Test report mode
  --log-file LOG_FILE   Log file path
  --log-mode {progress,short,detailed,verbose}
                        Logging mode of tests

other arguments:
  --no-color            Disable output log coloring
  --debug               Enable debug mode
  --clean, -c           Clean work directory
  --yes, -y             Confirming the cleaning of the work directory
  --help, -h            Show this help message and exit
  --version, -v         Show program's version number and exit
```

## 报告生成

执行脚本位于根目录下，命名为 `report.py`。

### 参数说明
```shell
usage: report.py --data-file DATA_FILE [--report-file REPORT_FILE] [--report-type {plain,junit,html}] [--verbosity {short,detailed,verbose}] [--test TEST]
                 [--sort-by {path,name,status,assertion,mode,structure,timeout,compile_time,execute_time}] [--sort-reverse]
                 [--filter-by {path,name,status,assertion,mode,structure,timeout,compile_time,execute_time,output}] [--filter-pattern FILTER_PATTERN] [--filter-invert] [--no-color] [--debug] [--help] [--version]

Reporter for Cangjie Harness

options:
  --data-file DATA_FILE, -i DATA_FILE
                        Path to file with test run data
  --report-file REPORT_FILE, -o REPORT_FILE
                        Path to the file to save the report. If it was not set, then print to console
  --report-type {plain,junit,html}, -t {plain,junit,html}
                        Test report type (default: plain)
  --verbosity {short,detailed,verbose}, -l {short,detailed,verbose}
                        Reporting verbosity level for plain text report (default: detailed)
  --test TEST           Show only test(s) details by name or path
  --sort-by {path,name,status,assertion,mode,structure,timeout,compile_time,execute_time}
                        Tests list sorting parameter for plain text report (default: path)
  --sort-reverse        Reverse sorting of tests list for plain text report
  --filter-by {path,name,status,assertion,mode,structure,timeout,compile_time,execute_time,output}
                        Parameter which will be used for filtering
  --filter-pattern FILTER_PATTERN
                        Tests filtering pattern
  --filter-invert       Use tests not matched to filtering pattern for report
  --no-color            Disable output log coloring for plain text report
  --debug               Enable debug mode
  --help, -h            Show this help message and exit
  --version, -v         Show program's version number and exit
```

### 运行示例

若需从元数据文件 `results.log.json` 生成含有默认配置的报告, 运行以下命令:

```shell
python3 ./report.py -i ./work/results.log.json
```

若需创建包含全部失败测试的报告, 运行以下命令:

```shell
python3 ./report.py -i ./work/results.log.json --filter-by status  --filter-pattern fail
```

若需创建基于特定目录的测试报告, 运行以下命令:

```shell
python3 ./report.py -i ./work/results.log.json --filter-by path  --filter-pattern src/tests
```

如有需要，您可以对报告中的测试列表进行排序。例如，若需查看编译时间最长的测试，可以创建一个按照测试编译时间排序的测试报告, 运行以下命令:

```shell
python3 ./report.py -i ./work/results.log.json --sort-by compile_time
```

同时，排序和过滤功能可以结合使用，来获取更具体的报告。例如，若需生成一份降序排序的全量失败测试报告, 运行以下命令:

```shell
python3 ./report.py -i ./work/results.log.json --filter-by status  --filter-pattern fail --sort-by mode --sort-reverse
```

## 报告对比

该差异比对工具处理测试运行的元数据文件，并生成包含以下信息的报告: 新增/移除的测试数量及具体清单; 结果不同/相同的测试数量，以及结果发生变化的测试清单; 日志不同/相同的测试数量，以及每个测试的日志差异比对结果。

执行脚本位于根目录下，命名为 `run_diff.py`。

### 参数说明
```shell
usage: run_diff.py [-o REPORT_FILE] [-t {plain,html}] [--test TEST] [-ho] [-hds] [-hdr] [-hdl] [--include-same] [--compare-commands] [--unify-paths] [--no-color] [--debug] [-h] [-v] first second

Diff for Cangjie Harness reports

general arguments:
  first                 First json report file for comparing
  second                Second json report file for comparing
  -o REPORT_FILE, --output-file REPORT_FILE
                        Path to the file to save the comparsion result. If it was not set, then print to console
  -t {plain,html}, --report-type {plain,html}
                        Test report type (default: plain) **html type is not supported yet**
  --test TEST           Show only test(s) details by name or path

format arguments:
  -ho, --hide-overview  Hide overview section in the plain text report
  -hds, --hide-diff-sets
                        Hide tests sets difference section in the plain text report
  -hdr, --hide-diff-res
                        Hide tests result difference section in the plain text report
  -hdl, --hide-diff-logs
                        Hide logs difference section in the plain text report

log diffs turning arguments:
  --include-same        Don't skip tests with same logs in log difference report
  --compare-commands    Add compile and execute commands in the logs comparsion
  --unify-paths         Replace '\' to '/' in logs (useful to check results from different OSes)

other arguments:
  --no-color            Disable output log coloring for the plain text report
  --debug               Enable debug mode
  -h, --help            Show this help message and exit
  -v, --version         Show program's version number and exit
```

### 运行示例

若需生成运行 `results1.log.json` 和 `results2.log.json` 测试时的差异对比, 运行以下命令:

```shell
python3 ./run_diff.py ./work/results1.log.json ./work/results2.log.json
```

若需创建特定测试的报告, 运行以下命令:

```shell
python3 ./run_diff.py ./work/results1.log.json ./work/results2.log.json --test "03_scope_principle/02_local_level/a06/test_a06_11.cj"
```

或使用如下的测试文件名:

```shell
python3 ./run_diff.py ./work/results1.log.json ./work/results2.log.json --test 03_02_03_02_a06_11
```

若需要，可以隐藏差异报告的特定部分。例如，若需查看总览和测试结果差异, 运行以下命令:

```shell
python3 ./run_diff.py ./work/results1.log.json ./work/results2.log.json --hide-diff-sets --hide-diff-logs
```

------------------------------------------------

## 仓颉 SPEC 一致性测试套件

仓颉 SPEC 一致性测试套件是一个测试用例的集合，这些测试用例旨在测试仓颉语言与其规范的对应关系。

### 目录结构 
```shell
testsuite/
|-- src
|   |-- tests    仓颉 SPEC 一致性测试用例集
|   |   |-- 01_lexical_structure
|   |   |-- 02_types
|   |   |-- 03_names_scopes_variables_and_modifiers
|   |   |-- 04_expressions
|   |   |-- 05_function
|   |   |-- 06_class_and_interface
|   |   |-- 07_property
|   |   |-- 08_extension
|   |   |-- 09_generics
|   |   |-- 10_overloading
|   |   |-- 11_packages_and_module_management
|   |   |-- 12_exceptions
|   |   |-- 13_multi_language_interoperability
|   |   |-- 14_metaprogramming
|   |   |-- 15_concurrency
|   |   |-- 16_constant_evaluation
|   |   |-- 17_annotation
|   |   |-- a_cangjie_grammar_summary
|   |   `-- assertions.csv
|   `-- utils    工具模块
`-- tdm
    |-- README.md    tdm模块说明文档
    |-- accept.py
    |-- plot_run_time.py
    `-- tests
```

### 测试环境准备

测试套件需要仓颉专用的驱动程序，即如果在测试执行期间调用仓颉编译器，并且没有通过命令行选项或配置文件明确设置编译器路径，则可能需要在启动前编辑并运行编译器提供的 `cangjie/envsetup.sh` 脚本。

### 运行测试套

运行所有用例:
```shell
python3 harness/harness.py --work-dir ./work --test-root ./testsuite --cjc-flags="-Woff unused" --tests testsuite/src/tests/
```

运行单个用例:
```shell
python3 harness/harness.py --work-dir ./work --test-root ./testsuite --log-mode verbose --cjc-flags="-Woff unused" --tests testsuite/src/tests/01_lexical_structure/01_identifiers_and_keywords/a01/test_a01_01.cj
```

### 测试套列表

支持排除和包含的测试列表。
* 使用 `--excluded-tests` 选项指定应该从测试运行中排除的测试
* 使用 `--included-tests` 选项指定应包含在测试运行中的测试