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

@Test
class Test_none_17 {
    /*
     * Test description:
     *     test the func of none set the Int
     * Test API:
     *     public func none(predicate: (T)-> Bool): Bool { ... }
     */
    @TestCase
    func test_none_01(): Unit {
        var emptyArr1: Array<Int64> = Array<Int64>()
        var normalArr1: Array<Int64> = Array<Int64>(10, repeat: 1)
        @Expect(emptyArr1.iterator().none({val: Int64 => (val * 2 == 0)}))
        @Expect(normalArr1.iterator().none({val: Int64 => (val % 2 == 0)}))
    }

    /*
     * Test description:
     *     test the func of none set the Int
     * Test API:
     *     public func none(predicate: (T)-> Bool): Bool { ... }
     */
    @TestCase
    func test_none_02(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "2")
        @Expect(emptyArr1.iterator().none({val: String => val != "2"}))
        @Expect(emptyArr1.iterator().none({val: String => val == "2"}))
        @Expect(!normalArr1.iterator().none({val: String =>val == "2"}))
        @Expect(normalArr1.iterator().none({val: String =>val != "2"}))
    }

    /*
     * Test description:
     *     test the func of none set the Float64
     * Test API:
     *     public func none(predicate: (T)-> Bool): Bool { ... }
     */
    @TestCase
    func test_none_03(): Unit {
        var emptyArr1: Array<Float64> = Array<Float64>()
        var normalArr1: Array<Float64> = Array<Float64>(10, repeat: Float64(1.11111))
        @Expect(emptyArr1.iterator().none({val: Float64 => val != Float64(1.11111)}))
        @Expect(emptyArr1.iterator().none({val: Float64 => val == Float64(1.11111)}))
        @Expect(!normalArr1.iterator().none({val: Float64 =>val == Float64(1.11111)}))
        @Expect(normalArr1.iterator().none({val: Float64 =>val != Float64(1.11111)}))
    }

    /*
     * Test description:
     *     test the func of none set the Rune
     * Test API:
     *     public func none(predicate: (T)-> Bool): Bool { ... }
     */
    @TestCase
    func test_none_04(): Unit {
        var emptyArr1: Array<Rune> = Array<Rune>()
        var normalArr1: Array<Rune> = Array<Rune>(10, repeat: r'♬')
        @Expect(emptyArr1.iterator().none({val: Rune => val != r'♬'}))
        @Expect(emptyArr1.iterator().none({val: Rune => val == r'♬'}))
        @Expect(!normalArr1.iterator().none({val: Rune =>val == r'♬'}))
        @Expect(normalArr1.iterator().none({val: Rune =>val != r'♬'}))
    }
}
