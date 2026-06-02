/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --bench --report-format=csv-raw --report-path=./reports
// (not Windows) RUN-EXEC: ls ./reports/benchmarks/bench-default.Test_Report_Path.csv
// (Windows): EXEC: dir ./reports/benchmarks/bench-default.Test_Report_Path.csv

@Test
public class Test_Report_Path {
    @Bench[x in [ 1, 2, 3 ] 
]
    func test_01(x: Int64) {
        @Expect(x > 0)
    }
}
