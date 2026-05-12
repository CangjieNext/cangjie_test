/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output

import std.time.*
import std.sync.*
import std.collection.*

// 用于生成时间相关报告
@Test
public class Test_Time_Bench_Types {
    @Strategy
    func strategy(): GenerateEachInputProvider<ArrayList<Int64>> {
        GenerateEachInputProvider {
            =>
            sleep(0.1 * Duration.second)
            ArrayList<Int64>()
        }
    }

    @Bench[x in strategy]
    @Types[T in<Int64, Float64>, U in<Int64, Float64, String>]
    @Configure[minDuration: 3 * Duration.second]
    func case001<T, U>(x: ArrayList<Int64>): Unit where T <: Hashable, U <: Hashable {
        sleep(0.1 * Duration.second)
    }
}
