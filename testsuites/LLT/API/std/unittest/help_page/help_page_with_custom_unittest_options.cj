/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix --help %run_args --no-color | compare %f

@UnittestOption[Bool](option, "The option is used for this and that")

/* SCAN
User defined options:
--option The option is used for this and that
    [Bool]
Unittest options:
--no-color [Bool] - Print the output colorless
--random-seed [Int64] - Seed for deterministic test reproduction
--parallel Specify parallelism of tests execution
    [Bool] - Run tests in parallel
    [Int64] - Run tests in parallel on %n processes
    [String] - Run tests in parallel on %n * actual number of cores, e.g. '--parallel=0.5nCores'
--timeout-each [String] - Execution time limit for each test case ('millis' | 's' | 'm' | 'h'), e.g. '10s', '9millis'
--filter [String] - Running a filtered by name subset of tests, e.g. '--filter=*.*Test,*.*case*'
--include-tags [String] - Include only tests with tags e.g. '--include-tags=Unittest+Smoke'
--exclude-tags [String] - Exclude tests with tags e.g. '--exclude-tags=Performance,Network'
--capture-output [Bool] - Disable immediate printing of test output, useful with --parallel
--no-capture-output [Bool] - Immediately print test output
--show-all-output [Bool] - Print output even for passed tests
--verbose [Bool] - Print tests execution status
--dry-run [Bool] - Print tests without execution
--show-tags [Bool] - Print tags in text report
--death-aware [Bool] - Handle abnormal tests exits, e.g. `Process.current.exit(42)`
--report-path [String] - Path where to create report file
--report-format [String] - Report format ('xml' for tests), ('csv', 'csw-raw', 'html' for benchmarks)
--bench [Bool] - Run only benchmarks (tests marked with @Bench)
--baseline-path [String] - Path of previous benchmark report to which to compare
--no-progress Disable progress report
    [Bool] - Disable progress report
--progress-brief Display brief progress report (single-line) instead of detailed one. Has lower precedence than `--no-progress`
    [Bool] - Do display single-line progress report
--progress-entries-limit Limit the entries amount displayed in the progress report. Has lower precedence than `--progress-brief`
    [Int64] - Limit value. Value 0 means no limit. Default: 0
--optimize-mocks-for-bench [Bool] - Optimize mocks when using benchmarks
*/
