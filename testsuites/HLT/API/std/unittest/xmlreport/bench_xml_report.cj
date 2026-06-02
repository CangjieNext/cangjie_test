/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-1: %run %run_opt %output %run_utest_opt %run_args --bench --reportFormat=xml --reportPath=./

import std.time.*

// 仓颉对二三维数组为浅拷贝
@Test
@Configure[minDuration: Duration.second]
@Configure[warmup: Duration.second]
@Configure[measurement: TimeNow(TimeUnit.Nanos)]
public class Test_Array_Clone {
    static var arr_32 = Array<Int64>(32, repeat: 0)

    @Bench
    func BenchmarkArrayCloneD1_N32(): Array<Int64> {
        return arr_32.clone()
    }
}
