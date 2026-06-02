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
class Test_isempty_13 {
    /*
     * Test description:
     *     test the func of isempty set the Int
     * Test API:
     *     public func isEmpty(): Bool { ... }
     */
    @TestCase
    func test_isempty_01(): Unit {
        var emptyArr1: Array<Int64> = Array<Int64>()
        var normalArr1: Array<Int64> = Array<Int64>(10, repeat: 1)
        @Expect(emptyArr1.iterator().isEmpty(), true)
        @Expect(normalArr1.iterator().isEmpty(), false)
    }

    /*
     * Test description:
     *     test the func of isempty set the String
     * Test API:
     *     public func isEmpty(): Bool { ... }
     */
    @TestCase
    func test_isempty_02(): Unit {
        let str_long = StringBuilder(r'a', 100000).toString()
        let emptyArr1: Array<String> = Array<String>()
        let normalArr1: Array<String> = Array<String>(5, repeat: "仓颉")
        let normalArr2: Array<String> = Array<String>(5, repeat: "")
        let normalArr3: Array<String> = Array<String>(5, repeat: "\0")
        let normalArr4: Array<String> = Array<String>(5, repeat: str_long)
        let normalArr5: Array<String> = Array<String>(5, repeat: "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈")
        @Expect(emptyArr1.iterator().isEmpty(), true)
        @Expect(normalArr1.iterator().isEmpty(), false)
        @Expect(normalArr2.iterator().isEmpty(), false)
        @Expect(normalArr3.iterator().isEmpty(), false)
        @Expect(normalArr4.iterator().isEmpty(), false)
        @Expect(normalArr5.iterator().isEmpty(), false)
    }

    /*
     * Test description:
     *     test the func of isempty set the Float64
     * Test API:
     *     public func isEmpty(): Bool { ... }
     */
    @TestCase
    func test_isempty_03(): Unit {
        var emptyArr1: Array<Float64> = Array<Float64>()
        let normalArr1: Array<Float64> = Array<Float64>(5, repeat: Float64(1.111111))
        @Expect(emptyArr1.iterator().isEmpty(), true)
        @Expect(normalArr1.iterator().isEmpty(), false)
    }

    /*
     * Test description:
     *     test the func of isempty set the Rune
     * Test API:
     *     public func isEmpty(): Bool { ... }
     */
    @TestCase
    func test_isempty_04(): Unit {
        var emptyArr1: Array<Rune> = Array<Rune>()
        let normalArr1: Array<Rune> = Array<Rune>(5, repeat: r'♬')
        @Expect(emptyArr1.iterator().isEmpty(), true)
        @Expect(normalArr1.iterator().isEmpty(), false)
    }
}
