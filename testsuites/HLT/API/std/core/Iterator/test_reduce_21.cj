/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*

var emptyArr1: Array<Int64> = Array<Int64>()
var normalArr1: Array<Int64> = Array<Int64>(10, {val => val * 2})
var emptyArr2: Array<(Int64, Int64)> = Array<(Int64, Int64)>()
var normalArr2: Array<(Int64, Int64)> = Array<(Int64, Int64)>(10, {val => (val, val * 2)})
var bufferArrList1: ArrayList<Int64> = ArrayList<Int64>()
var tmpArr: Array<Int64> = Array<Int64>(10, {val => val * 2})

@Test
class Test_reduce_21 {

    /*
     * Test description:
     *     test the func of reduce set the Int
     * Test API:
     *     public func fold<T, R>(initial: R, operation: (R, T) -> R): (Iterable<T>) -> R
     */
    @TestCase
    func test_reduce_01(): Unit {
        var emptyArr1: Array<Int64> = Array<Int64>()
        var normalArr1: Array<Int64> = Array<Int64>(10, {val => val * 2})
        var reduceFunc = {
            val: Int64, item: Int64 => item
        }
        @Expect(emptyArr1.iterator().reduce(reduceFunc), None)
        @Expect(normalArr1.iterator().reduce(reduceFunc), Some(18))
    }

    /*
     * Test description:
     *     test the func of reduce set the Int
     * Test API:
     *     public func fold<T, R>(initial: R, operation: (R, T) -> R): (Iterable<T>) -> R
     */
    @TestCase
    func test_reduce_02(): Unit {
        var emptyArr1: Array<Int64> = Array<Int64>()
        var normalArr1: Array<Int64> = Array<Int64>(10, repeat: 1)
        var reduceFunc = {
            val: Int64, item: Int64 => val
        }
        @Expect(emptyArr1.iterator().reduce(reduceFunc), None)
        @Expect(normalArr1.iterator().reduce(reduceFunc), Some(1))
    }

    /*
     * Test description:
     *     test the func of reduce set the String
     * Test API:
     *     public func fold<T, R>(initial: R, operation: (R, T) -> R): (Iterable<T>) -> R
     */
    @TestCase
    func test_reduce_03(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "1")
        var reduceFunc = {
            val: String, item: String => "${val}"
        }
        @Expect(emptyArr1.iterator().reduce(reduceFunc), None)
        @Expect(normalArr1.iterator().reduce(reduceFunc), Some("1"))
    }

    /*
     * Test description:
     *     test the func of reduce set the String
     * Test API:
     *     public func fold<T, R>(initial: R, operation: (R, T) -> R): (Iterable<T>) -> R
     */
    @TestCase
    func test_reduce_04(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "1")
        var reduceFunc = {
            val: String, item: String => "${val} + ${item}"
        }
        @Expect(emptyArr1.iterator().reduce(reduceFunc), None)
        @Expect(normalArr1.iterator().reduce(reduceFunc), Some("1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1"))
    }

    /*
     * Test description:
     *     test the func of reduce set the Float
     * Test API:
     *     public func fold<T, R>(initial: R, operation: (R, T) -> R): (Iterable<T>) -> R
     */
    @TestCase
    func test_reduce_05(): Unit {
        var emptyArr1: Array<Float64> = Array<Float64>()
        var normalArr1: Array<Float64> = Array<Float64>(10, repeat: Float64(1.111111))
        var reduceFunc = {
            val: Float64, item: Float64 => item
        }
        @Expect(emptyArr1.iterator().reduce(reduceFunc), None)
        @Expect(normalArr1.iterator().reduce(reduceFunc), Some(Float64(1.111111)))
    }
}
