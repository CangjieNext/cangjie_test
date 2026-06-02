/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC-1: %run %run_opt %output %run_utest_opt %run_args --no-color --bench --report-format=csv --report-path=./tmp
// RUN-EXEC-1: %cat ./tmp/benchmarks/bench-default.EmptyBenchClass1.csv
// RUN-EXEC-1: %cat ./tmp/benchmarks/bench-default.EmptyBenchClass2.csv
// RUN-EXEC-1: %cat ./tmp/benchmarks/bench-default.EmptyBenchClass3.csv

import std.unittest.*
import std.unittest.testmacro.*

@Test
class EmptyBenchClass1 {}

@Test
class EmptyBenchClass2 {
    @Bench
    func failed() {
        @Assert(false)
    }
}

@Test
class EmptyBenchClass3 {
    @Bench
    @Skip
    func skipped() {}
}
