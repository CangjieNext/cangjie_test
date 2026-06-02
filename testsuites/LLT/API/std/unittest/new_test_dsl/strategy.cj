/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt --no-color | compare %f
// ASSERT: scan PASSED: 3
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.sort.*
import std.collection.*

var x = 0

@Test
@Configure[minDuration: Duration.second]
class FooTest {
    @Strategy[len in [ 1, 100, 10000 ]]
    func reverseArray1(len: Int64): Array<Int64> {
        Array(len, {i: Int64 => len - i})
    }

    @TestCase[arr in reverseArray1]
    func test1(arr: Array<Int64>) {
        arr.sort()
        @Assert(arr[0]==1)
    }

    @TestCase[arr in reverseArray1]
    func test2(arr: Array<Int64>) {
        @Assert(arr[0]==arr.size)
    }

    @Strategy[len in [ 1, 100, 10000 ]]
    func reverseArray(len: Int64): Array<Int64> {
        Array(len, {i: Int64 => len - i})
    }

    @Strategy[array in reverseArray, param in [ 1, 2 ]]
    func reverseArrayClone(array: Array<Int64>, param: Int64): Array<Int64> {
        array.clone()
    }

    @TestCase[arr in reverseArrayClone]
    func test3(arr: Array<Int64>) {
        @Assert(arr[0]==arr.size)
    }
}
