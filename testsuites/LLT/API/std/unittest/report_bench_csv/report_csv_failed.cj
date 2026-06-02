/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC-1: %run %run_opt %output %run_utest_opt %run_args --no-color --bench --report-format=csv --report-path=./tmp
// RUN-EXEC-PIPE: %cat ./tmp/benchmarks/bench-default.FailedBenchClass.csv | compare %f
// ASSERT: regex-begin Case,Args,Median,Err,Err%,Mean,Unit
// ASSERT: regex-0 "failedBench","false","\d+.\d+",("\d+.\d+")?,("((\d+.\d+)|inf)")?,"\d+.\d+","ns"
// ASSERT: regex-1 "failedBench","true","\d+.\d+",("\d+.\d+")?,("((\d+.\d+)|inf)")?,"\d+.\d+","ns"

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@Test
@Configure[minDuration: Duration.nanosecond, warmup: Duration.nanosecond]
class FailedBenchClass {
    @Bench[failed in [ true, false ]]
    func failedBench(failed: Bool) {
        @Assert(failed)
    }
}
