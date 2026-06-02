/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt --no-color --bench | compare %f
// ASSERT: scan PASSED: 1
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sort.*
import std.collection.*

@Strategy[len in [ 100, 10000 ]]
func reverseArray1(len: Int64): GenerateEachInputProvider<Array<Int64>> {
    let array = Array(len, {i: Int64 => len - i})
    GenerateEachInputProvider {=> array.clone()}
}

@Test
@Configure[minDuration: Duration.second]
class FooTest {
    @Bench[arr in reverseArray1]
    func bench1(arr: Array<Int64>) {
        arr.sort()
    }
}
