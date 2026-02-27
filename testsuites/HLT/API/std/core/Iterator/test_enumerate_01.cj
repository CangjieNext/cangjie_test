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
class Test_enumerate_01 {
    /*
     * Test description:
     *     test the func of enumerate set the Int
     * Test API:
     *     public func enumerate(): Iterator<(Int64, T)> { ... }
     */
    @TestCase
    func test_enumerate_01(): Unit {
        var emptyArr1: Array<Int64> = Array<Int64>()
        var normalArr1: Array<Int64> = Array<Int64>(10, {val => val * 2})
        var emptyArr2: Array<(Int64, Int64)> = Array<(Int64, Int64)>()
        var normalArr2: Array<(Int64, Int64)> = Array<(Int64, Int64)>(10, {val => (val, val * 2)})
        @Expect(collectHashMap<Int64, Int64>(emptyArr1.iterator().enumerate()), HashMap<Int64, Int64>())
        @Expect(collectHashMap<Int64, Int64>(normalArr1.iterator().enumerate()), HashMap<Int64, Int64>(normalArr2))
    }

    /*
     * Test description:
     *     test the func of enumerate set the String
     * Test API:
     *     public func enumerate(): Iterator<(Int64, T)> { ... }
     */
    @TestCase
    func test_enumerate_02(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "cangjie")
        var emptyArr2: Array<(Int64, String)> = Array<(Int64, String)>()
        var normalArr2: Array<(Int64, String)> = Array<(Int64, String)>(10, {val => (val, "cangjie")})
        @Expect(collectHashMap<Int64, String>(emptyArr1.iterator().enumerate()), HashMap<Int64, String>())
        @Expect(collectHashMap<Int64, String>(normalArr1.iterator().enumerate()), HashMap<Int64, String>(normalArr2))
    }

    /*
     * Test description:
     *     test the func of enumerate set the String
     * Test API:
     *     public func enumerate(): Iterator<(Int64, T)> { ... }
     */
    @TestCase
    func test_enumerate_03(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "仓颉")
        var emptyArr2: Array<(Int64, String)> = Array<(Int64, String)>()
        var normalArr2: Array<(Int64, String)> = Array<(Int64, String)>(10, {val => (val, "仓颉")})
        @Expect(collectHashMap<Int64, String>(emptyArr1.iterator().enumerate()), HashMap<Int64, String>())
        @Expect(collectHashMap<Int64, String>(normalArr1.iterator().enumerate()), HashMap<Int64, String>(normalArr2))
    }

    /*
     * Test description:
     *     test the func of enumerate set the String
     * Test API:
     *     public func enumerate(): Iterator<(Int64, T)> { ... }
     */
    @TestCase
    func test_enumerate_04(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "")
        var emptyArr2: Array<(Int64, String)> = Array<(Int64, String)>()
        var normalArr2: Array<(Int64, String)> = Array<(Int64, String)>(10, {val => (val, "")})
        @Expect(collectHashMap<Int64, String>(emptyArr1.iterator().enumerate()), HashMap<Int64, String>())
        @Expect(collectHashMap<Int64, String>(normalArr1.iterator().enumerate()), HashMap<Int64, String>(normalArr2))
    }

    /*
     * Test description:
     *     test the func of enumerate set the String
     * Test API:
     *     public func enumerate(): Iterator<(Int64, T)> { ... }
     */
    @TestCase
    func test_enumerate_05(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "\0")
        var emptyArr2: Array<(Int64, String)> = Array<(Int64, String)>()
        var normalArr2: Array<(Int64, String)> = Array<(Int64, String)>(10, {val => (val, "\0")})
        @Expect(collectHashMap<Int64, String>(emptyArr1.iterator().enumerate()), HashMap<Int64, String>())
        @Expect(collectHashMap<Int64, String>(normalArr1.iterator().enumerate()), HashMap<Int64, String>(normalArr2))
    }

    /*
     * Test description:
     *     test the func of enumerate set the String
     * Test API:
     *     public func enumerate(): Iterator<(Int64, T)> { ... }
     */
    @TestCase
    func test_enumerate_06(): Unit {
        let str_long = StringBuilder(r'a', 100000).toString()
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: str_long)
        var emptyArr2: Array<(Int64, String)> = Array<(Int64, String)>()
        var normalArr2: Array<(Int64, String)> = Array<(Int64, String)>(10, {val => (val, str_long)})
        @Expect(collectHashMap<Int64, String>(emptyArr1.iterator().enumerate()), HashMap<Int64, String>())
        @Expect(collectHashMap<Int64, String>(normalArr1.iterator().enumerate()), HashMap<Int64, String>(normalArr2))
    }

    /*
     * Test description:
     *     test the func of enumerate set the String
     * Test API:
     *     public func enumerate(): Iterator<(Int64, T)> { ... }
     */
    @TestCase
    func test_enumerate_07(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈")
        var emptyArr2: Array<(Int64, String)> = Array<(Int64, String)>()
        var normalArr2: Array<(Int64, String)> = Array<(Int64, String)>(10, {val => (val,
                "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈")})
        @Expect(collectHashMap<Int64, String>(emptyArr1.iterator().enumerate()), HashMap<Int64, String>())
        @Expect(collectHashMap<Int64, String>(normalArr1.iterator().enumerate()), HashMap<Int64, String>(normalArr2))
    }

    /*
     * Test description:
     *     test the func of enumerate set the Float
     * Test API:
     *     public func enumerate(): Iterator<(Int64, T)> { ... }
     */
    @TestCase
    func test_enumerate_08(): Unit {
        var emptyArr1: Array<Float64> = Array<Float64>()
        var normalArr1: Array<Float64> = Array<Float64>(10, repeat: Float64(1.11111))
        var emptyArr2: Array<(Int64, Float64)> = Array<(Int64, Float64)>()
        var normalArr2: Array<(Int64, Float64)> = Array<(Int64, Float64)>(10, {val => (val, Float64(1.11111))})
        @Expect(collectHashMap<Int64, Float64>(emptyArr1.iterator().enumerate()), HashMap<Int64, Float64>())
        @Expect(collectHashMap<Int64, Float64>(normalArr1.iterator().enumerate()), HashMap<Int64, Float64>(normalArr2))
    }

    /*
     * Test description:
     *     test the func of enumerate set the rune
     * Test API:
     *     public func enumerate(): Iterator<(Int64, T)> { ... }
     */
    @TestCase
    func test_enumerate_09(): Unit {
        var emptyArr1: Array<Rune> = Array<Rune>()
        var normalArr1: Array<Rune> = Array<Rune>(10, repeat: r'♬')
        var emptyArr2: Array<(Int64, Rune)> = Array<(Int64, Rune)>()
        var normalArr2: Array<(Int64, Rune)> = Array<(Int64, Rune)>(10, {val => (val, r'♬')})
        @Expect(collectHashMap<Int64, Rune>(emptyArr1.iterator().enumerate()), HashMap<Int64, Rune>())
        @Expect(collectHashMap<Int64, Rune>(normalArr1.iterator().enumerate()), HashMap<Int64, Rune>(normalArr2))
    }
}
