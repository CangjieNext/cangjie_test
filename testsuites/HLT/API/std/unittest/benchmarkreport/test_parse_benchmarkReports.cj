/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./test_report_combination.cj
// EXEC: %compiler %cmp_opt %cmp_utest_opt test_report_combination.cj -o test_report_combination.%suffix
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx test_report_combination.%suffix %run_args %run_utest_opt --bench --report-format=Csv-Raw --report-path=./csv-raw && %run %run_opt test_report_combination.%suffix %run_args %run_utest_opt --bench --report-format=Csv --report-path=./csv &&  %run %run_opt %output  %run_utest_opt %run_argsimport std.collection.*
import std.collection.*
import stdx.unittest.data.*

@Test
public class Test_Report_Parse {
    @TestCase[results in csv("./csv/benchmarks/bench-default.Test_Report_Combination.csv")]
    func test_parse_result(results: HashMap<String, String>): Unit {
        @Expect(results["Case"].contains("BenchmarkDataInStrategy") || results["Case"].contains("BenchmarkBenchDSL"))
        var count = 0
        for (v1 in [16, 256]) {
            for (v2 in ["start", "end", "a", "A"]) {
                if (results["Args"].contains("${v1},${v2}")) {
                    count++
                }
            }
        }
        @Expect(count, 1)

        for (name in ["Median", "Err", "Err%", "Mean", "Unit"]) {
            @Expect(results.contains(name))
        }
    }

    @TestCase[results in csv("./csv-raw/benchmarks/bench-default.Test_Report_Combination.csv")]
    func test_parse_rawData(results: HashMap<String, String>): Unit {
        @Expect(results["Case"].contains("BenchmarkDataInStrategy") || results["Case"].contains("BenchmarkBenchDSL"))
        var count = 0
        for (v1 in [16, 256]) {
            for (v2 in ["start", "end", "a", "A"]) {
                if (results["Args"].contains("${v1},${v2}")) {
                    count++
                }
            }
        }
        @Expect(count, 1)

        for (name in ["BatchSize", "Duration", "Unit"]) {
            @Expect(results.contains(name))
        }
    }
}
