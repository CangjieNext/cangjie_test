/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.math.*

@Test
class BoxTest {
    /*
     * Test description: class Box ::core
     * Test API:
     * extend<T> Box<T> <: Comparable<Box<T>> where T <: Comparable<T>
     */
    @TestCase
    func testComparable(): Unit {
        @Expect(Box(Int64(1)),Box(Int64(1)))
        @Expect(Box(Int64(2))!=Box(Int64(1)))
        @Expect(Box(Int64(1)) < Box(Int64(2)))
        @Expect(Box(Int64(2))>Box(Int64(1)))
        @Expect(Box(Int64(1))<=Box(Int64(2)))
        @Expect(Box(Int64(2))>=Box(Int64(1)))
        @Expect(Box(Int64(2)).compare(Box(Int64(1))),Ordering.GT)
        @Expect(Box(Int64(1)).compare(Box(Int64(2))),Ordering.LT)
        @Expect(Box(Int64(1)).compare(Box(Int64(1))),Ordering.EQ)
    }

    /*
     * Test description: class Box ::core
     * Test API:
     * public func hashCode(): Int64
     */
    @TestCase
    func testHashCode(): Unit {
        @Expect(Box(Int64(1)).hashCode(),1)
    }

    /*
     * Test description: class Box ::core
     * Test API:
     * public func toString(): String
     */
    @TestCase
    func testToString(): Unit {
        @Expect(Box(Int64(1)).toString(),"1")
    }
}
