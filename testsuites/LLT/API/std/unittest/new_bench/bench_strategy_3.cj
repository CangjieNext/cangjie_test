/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-0: %export cjHeapSize=1gb && %run %run_opt %output %run_utest_opt --no-color --bench | compare %f
// ASSERT: scan PASSED: 1
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sort.*
import std.collection.*

@Test
@Configure[minDuration: Duration.second * 0.5, warmup: Duration.second * 0.5]
class FooTest {
    @Strategy[len in [ 100, 10000 ]]
    func reverseArray(len: Int64): Array<Int64> {
        Array(len, { i: Int64 => len - i })
    }

    @Strategy[array in reverseArray, param in [ 1, 2 ]]
    func reverseArrayClone(array: Array<Int64>, param: Int64): BatchInputProvider<Array<Int64>> {
        BatchInputProvider {=> array.clone()}
    }

    @Bench[arr in reverseArrayClone]
    func bench3(arr: Array<Int64>) {
        arr.sort()
    }
}
