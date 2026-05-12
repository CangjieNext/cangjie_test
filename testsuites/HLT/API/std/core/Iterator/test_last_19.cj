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
class Test_last_19 {
    /*
     * Test description:
     *     test the func of last set the Int
     * Test API:
     *     public func last(): Option<T>
     */
    @TestCase
    func test_last_01(): Unit {
        var emptyArr1: Array<Int64> = Array<Int64>()
        var normalArr1: Array<Int64> = Array<Int64>(10, {val => val * 2})
        @Expect(emptyArr1.iterator().last(), None)
        @Expect(normalArr1.iterator().last(), Some(18))
    }

    /*
     * Test description:
     *     test the func of last set the Int
     * Test API:
     *     public func last(): Option<T>
     */
    @TestCase
    func test_last_02(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = ["2", "3", "4", "5", "6", "7", "8", "9", "10"]
        @Expect(emptyArr1.iterator().last(),None)
        @Expect(normalArr1.iterator().last(),Some("10"))
    }

    /*
     * Test description:
     *     test the func of last set the Float64
     * Test API:
     *     public func last(): Option<T>
     */
    @TestCase
    func test_last_03(): Unit {
        var emptyArr1: Array<Float64> = Array<Float64>()
        var normalArr1: Array<Float64> = [Float64(1.11111), Float64(1.11112), Float64(1.11113)]
        @Expect(emptyArr1.iterator().last(), None)
        @Expect(normalArr1.iterator().last(), Some(Float64(1.11113)))
    }

    /*
     * Test description:
     *     test the func of last set the Rune
     * Test API:
     *     public func last(): Option<T>
     */
    @TestCase
    func test_last_04(): Unit {
        var emptyArr1: Array<Rune> = Array<Rune>()
        var normalArr1: Array<Rune> = [r'♬', r'✲', r'✿', r'❈', r'❆']
        @Expect(emptyArr1.iterator().last(), None)
        @Expect(normalArr1.iterator().last(),Some(r'❆'))
    }
}
