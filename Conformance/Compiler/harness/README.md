# Harness for Cangjie Language

Harness automates testing process and allows run the cangjie tests and generate the reports. 

Harness was developed for testing Cangjie language, but can be easily modified and used for other languages and goals.

An executable placed in the root directory and named `harness.py`.

## Directory Structure
```shell
harness/
|-- README.md    Documentation for the Harness test framework
|-- base-settings.json    Default configuration file
|-- core    Core module
|   |-- __init__.py
|   |-- config.py    Configuration class for the testing framework
|   |-- config_manager.py    Handles loading/saving and getting/setting of configurations
|   |-- driver_list.py    Registers all drivers and sets the default driver
|   |-- driver_manager.py    Driver handling and lifecycle management
|   |-- report_manager.py    Report generation and log management
|   `-- task_manager.py    Test discovery and driver scheduling
|-- demo    Demo codes
|-- diff    Difference comparison module
|   |-- __init__.py
|   |-- diff_template
|   |   `-- diff_template.html    HTML difference report template
|   |-- html_diff.py    Generates HTML formatted test report differences
|   `-- plain_text_diff.py    Generates plain text formatted test report differences
|-- drivers    Driver module
|   |-- __init__.py
|   |-- runner
|   |   |-- __init__.py
|   |   |-- base_runner.py    Base class implementation for runners
|   |   |-- lang_runner.py    Language test compilation and execution driver
|   |   `-- simple_py_runner.py    Simplified Python script execution driver
|   `-- test
|       |-- __init__.py
|       |-- base_test.py    Base class for test cases
|       |-- fake_test.py    Mock test class
|       `-- test.py
|-- excluded.lst    Example of an exclusion list
|-- harness.py    Harness test framework execution script
|-- included.lst    Example of an inclusion list
|-- report.py    Report generation execution script
|-- reporter    Report generation module
|   |-- __init__.py
|   |-- html_reporter.py    Generates HTML format test reports
|   |-- junit_reporter.py    Generates JUnit format test reports
|   |-- plain_text_reporter.py    Generates plain text format test reports
|   |-- report_template
|   |   `-- report_template.html    HTML report template file
|   `-- tree_view.pyl    Tree structure processing class and methods
|-- run_diff.py    Report comparison execution script
|-- sample_tests    Sample tests
|-- tdm    tdm module
|   |-- README.md    Documentation for the tdm module
|   |-- accept.py
|   |-- plot_gantt.py    Creates a Gantt chart for pipeline test compilation and execution
|   |-- plot_mem_usage.py    Creates a memory usage chart for test runs
|   `-- tests
|-- tests    Test module
|   |-- __init__.py
|   |-- config_tests.py    Unit tests for Config class
|   |-- driver_tests.py    Unit tests for DriverManager class
|   |-- resources
|   |-- simple_py_runner_tests.py    Unit tests for SimplePyRunner class
|   |-- test_tests.py    Unit tests for Test class
|   `-- utils_tests.py    Unit tests for core utility functions
`-- utils    Utility module
    |-- __init__.py
    |-- utils.py    Provide utility functions
    |-- version.py
    `-- win_killpg.py    Process group termination tool for Windows platform
```

## Dependencies:

- Python 3.6+

## Testsuite Creation and Configurations

### Config File

In root of the harness the `base-settings.json` file exists. It's used as defaults for all options. You can copy it with name `local-settings.json` and change necessary options to use your own local settings for tests execution. Also, if some option was set through command line argument it will be used during the tests execution not from settings file.

Please read the chapter of Harness command-line options for more information on supported Harness options.
Here is an example, the `base-settings.json` file has some default option values:
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

### Creating a Test Suite

Typically, the root directory of a test suite contains the following contents:
* A `README.md` file that provides a brief description of the test suite
* A `src` folder containing the test source files

The tests in the `src` folder can have an arbitrarily deep hierarchical directory structure, with each subdirectory potentially containing a specification assertion or test-related files. Harness will search through the entire directory tree and collect individual test cases.

Harness identifies any file whose name starts with the string `test` and ends with the `.cj` extension as a test case. Any necessary auxiliary files can be placed in each subdirectory. 
Please note that even if a file name contains the substring `test`, it will be skipped during test execution if it is in the exclusion list specified by the Harness parameters, or if it does not match the given mask provided by the `--tests` option.
Usually, a test suite can also contain common utilities used by most tests (such as `src/utils` directory).

### Writing Tests

Each test source file includes a special header in the comment section above, where the comments describe its purpose, usage scenarios, and the main test attributes, specifying the test attributes through specially formatted tags.
Based on the value of these tags:
* It determines how the test framework compiles and executes the tests
* It decides which execution status should be reported based on the actual compilation and execution results of the tests

A test file should be a file that contains a `main()` function, and its name should start with the `test` prefix. Additionally, a test can consist of multiple files, such as for testing package import scenarios. Such auxiliary files should not start with the `test` string in their names.

Test Example：testsuite/src/tests/01_lexical_structure/01_identifiers_and_keywords/a02/test_a02_01.cj
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

The execution mode of this test case is Run, which means that Harness will compile the test case and then run the resulting binary. Therefore, the test case must compile successfully; otherwise, the test will fail. After the test completes, Harness will analyze the exit code and determine the final test result.

#### Test Case Tags

Basic Tags:

* `@Name` - The name of the compiled executable (default is the test filename without the extension)
* `@Mode (Run/Compileonly)` - The execution mode of the test (default is Run)
* `@Negative (Yes/No)` - Whether the test is a negative test (default is No)
* `@CompileWarning (No/Yes/Ignore)` - Whether a compilation warning is expected
* `@Replay` - Indicates that the test is non-deterministic
* `@MacroLib` - Indicates whether the file is a macro library
* `@AutoDiff` - Marks a test that requires automatic differentiation to be enabled
* `@ExpectTimeout` - Whether the test executable is expected to hang
* `@TimeoutFactor` - The timeout factor for the test
* `@Assertion` - Identifier and text of the corresponding assertion
* `@Description` - Description of the test as part of the assertion
* `@Comment` - Optional comment
* `@Issue` - The compiler error number associated with the test, if it has previously failed due to that issue

## Running Instructions

You can run all example test cases using the following command：
```shell
python3 ./harness.py --work-dir ./work --test-root ./demo --log-mode verbose --base-timeout 30 --tests demo/src/doc
```

Parameter description：Specified parameters will override the settings in the framework configuration file
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

## Report Generator

An executable placed in the root directory and named `report.py`.

### Description of Options:
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

### Run examples:

To generate a report with default settings from the metadata file `results.log.json`, run the following command:

```shell
python3 ./report.py -i ./work/results.log.json
```

To create a report with all failed tests, run the following command:

```shell
python3 ./report.py -i ./work/results.log.json --filter-by status  --filter-pattern fail
```

To create a report with tests from specific directory, run the following command:

```shell
python3 ./report.py -i ./work/results.log.json --filter-by path  --filter-pattern src/tests
```

If necessary, you can sort the list of tests in the report. For example, you want to view tests that have the longest compilation time. To do this, you can create a report in which the list of tests is sorted by test compilation time, run the following command:

```shell
python3 ./report.py -i ./work/results.log.json --sort-by compile_time
```

Also you can combine sorting and filtering to get more specific report. For example, to generate a report with all failed tests sorted by mode in descending order, run the following command:

```shell
python3 ./report.py -i ./work/results.log.json --filter-by status  --filter-pattern fail --sort-by mode --sort-reverse
```

## Diff for Cangjie Harness Reports

The diff tool works with metadata files of test runs and prepared report with following information: number of tests added/removed and list of these tests; number of different/same results and list of tests that have changed results; number of different/same logs and diffs of logs for each test.

An executable placed in the root directory and named `run_diff.py`.

### Description of Options:
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

### Run Examples:

To generate a diff of two test runs `results1.log.json` and `results2.log.json`, run the following command:

```shell
python3 ./run_diff.py ./work/results1.log.json ./work/results2.log.json
```

To create a report for specific test, run the following command:

```shell
python3 ./run_diff.py ./work/results1.log.json ./work/results2.log.json --test "03_scope_principle/02_local_level/a06/test_a06_11.cj"
```

or test name can be used:

```shell
python3 ./run_diff.py ./work/results1.log.json ./work/results2.log.json --test 03_02_03_02_a06_11
```

If necessary, you can hide some parts of diff. For example, you want to view Overview and Tests result difference, run the following command:

```shell
python3 ./run_diff.py ./work/results1.log.json ./work/results2.log.json --hide-diff-sets --hide-diff-logs
```

------------------------------------------------

## Cangjie SPEC Conformance Test Suite

The Cangjie SPEC Conformance Test Suite is a collection of test cases designed to verify that the Cangjie language conforms to its specification.

### 目录结构 
```shell
testsuite/
|-- src
|   |-- tests    Cangjie SPEC conformance test cases
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
|   `-- utils    Utility modules
`-- tdm
    |-- README.md    Documentation for the tdm module
    |-- accept.py
    |-- plot_run_time.py
    `-- tests
```

### Test Environment Setup

The test suite requires a dedicated driver for Cangjie. If the Cangjie compiler is called during test execution, and the compiler path is not explicitly set via command-line options or configuration files, you may need to run the `cangjie/envsetup.sh` script provided by the compiler before starting the test.

### Running the Test Suite

Run All Test Cases:
```shell
python3 harness/harness.py --work-dir ./work --test-root ./testsuite --cjc-flags="-Woff unused" --tests testsuite/src/tests/
```

Run a Single Test Case:
```shell
python3 harness/harness.py --work-dir ./work --test-root ./testsuite --log-mode verbose --cjc-flags="-Woff unused" --tests testsuite/src/tests/01_lexical_structure/01_identifiers_and_keywords/a01/test_a01_01.cj
```

### Test List

The test list supports both inclusion and exclusion of specific test cases.
* Use the `--excluded-tests` option to specify tests that should be excluded from the test run
* Use the `--included-tests` option to specify tests that should be included in the test run