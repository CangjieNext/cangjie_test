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

var collectStringFunc = collectString<Int64>(delimiter: ",")

@Test
class Test_filter_02 {
    /*
     * Test description:
     *     test the func of filter set the Int
     * Test API:
     *     public func filter(predicate: (T)-> Bool): Iterator<T> { ... }
     */
    @TestCase
    func test_filter_01(): Unit {
        var emptyArr1: Array<Int64> = Array<Int64>()
        var normalArr1: Array<Int64> = Array<Int64>(10, {val => val * 2})
        @Expect(collectStringFunc(emptyArr1.iterator().filter({val: Int64 => val > 1})), "")
        @Expect(collectStringFunc(normalArr1.iterator().filter({val: Int64 => val > 1})), "2,4,6,8,10,12,14,16,18")
    }

    /*
     * Test description:
     *     test the func of filter set the String
     * Test API:
     *     public func filter(predicate: (T)-> Bool): Iterator<T> { ... }
     */
    @TestCase
    func test_filter_02(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "cangjie")
        @Expect(collectArray(emptyArr1.iterator().filter({val: String => val == "cangjie"})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().filter({val: String => val == "cangjie"})), Array<String>(10, repeat: "cangjie"))
        @Expect(collectArray(normalArr1.iterator().filter({val: String => val != "cangjie"})), Array<String>())
    }

    /*
     * Test description:
     *     test the func of filter set the String
     * Test API:
     *     public func filter(predicate: (T)-> Bool): Iterator<T> { ... }
     */
    @TestCase
    func test_filter_03(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "仓颉")
        @Expect(collectArray(emptyArr1.iterator().filter({val: String => val == "仓颉"})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().filter({val: String => val == "仓颉"})), Array<String>(10, repeat: "仓颉"))
        @Expect(collectArray(normalArr1.iterator().filter({val: String => val != "仓颉"})), Array<String>())
    }

    /*
     * Test description:
     *     test the func of filter set the String
     * Test API:
     *     public func filter(predicate: (T)-> Bool): Iterator<T> { ... }
     */
    @TestCase
    func test_filter_04(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "")
        @Expect(collectArray(emptyArr1.iterator().filter({val: String => val == ""})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().filter({val: String => val == ""})), Array<String>(10, repeat: ""))
        @Expect(collectArray(normalArr1.iterator().filter({val: String => val != ""})), Array<String>())
    }

    /*
     * Test description:
     *     test the func of filter set the String
     * Test API:
     *     public func filter(predicate: (T)-> Bool): Iterator<T> { ... }
     */
    @TestCase
    func test_filter_05(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "\0")
        @Expect(collectArray(emptyArr1.iterator().filter({val: String => val == "\0"})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().filter({val: String => val == "\0"})), Array<String>(10, repeat: "\0"))
        @Expect(collectArray(normalArr1.iterator().filter({val: String => val != "\0"})), Array<String>())
    }

    /*
     * Test description:
     *     test the func of filter set the String
     * Test API:
     *     public func filter(predicate: (T)-> Bool): Iterator<T> { ... }
     */
    @TestCase
    func test_filter_06(): Unit {
        let str_long = StringBuilder(r'a', 100000).toString()
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: str_long)
        @Expect(collectArray(emptyArr1.iterator().filter({val: String => val == str_long})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().filter({val: String => val == str_long})), Array<String>(10, repeat: str_long))
        @Expect(collectArray(normalArr1.iterator().filter({val: String => val != str_long})), Array<String>())
    }

    /*
     * Test description:
     *     test the func of filter set the String
     * Test API:
     *     public func filter(predicate: (T)-> Bool): Iterator<T> { ... }
     */
    @TestCase
    func test_filter_07(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈")
        @Expect(collectArray(emptyArr1.iterator().filter({val: String => val == "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().filter({val: String => val == "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"})), Array<String>(10, repeat: "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"))
        @Expect(collectArray(normalArr1.iterator().filter({val: String => val != "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"})), Array<String>())
    }

    /*
     * Test description:
     *     test the func of filter set the Float
     * Test API:
     *     public func filter(predicate: (T)-> Bool): Iterator<T> { ... }
     */
    @TestCase
    func test_filter_08(): Unit {
        var emptyArr1: Array<Float64> = Array<Float64>()
        var normalArr1: Array<Float64> = Array<Float64>(10, repeat: Float64(1.11111))
        @Expect(collectArray(emptyArr1.iterator().filter({val: Float64 => val == Float64(1.11111)})), Array<Float64>())
        @Expect(collectArray(normalArr1.iterator().filter({val: Float64 => val == Float64(1.11111)})), Array<Float64>(10, repeat: Float64(1.11111)))
        @Expect(collectArray(normalArr1.iterator().filter({val: Float64 => val != Float64(1.11111)})), Array<Float64>())
    }

    /*
     * Test description:
     *     test the func of filter set the Rune
     * Test API:
     *     public func filter(predicate: (T)-> Bool): Iterator<T> { ... }
     */
    @TestCase
    func test_filter_09(): Unit {
        var emptyArr1: Array<Rune> = Array<Rune>()
        var normalArr1: Array<Rune> = Array<Rune>(10, repeat: r'♬')
        @Expect(collectArray(emptyArr1.iterator().filter({val: Rune => val == r'♬'})), Array<Rune>())
        @Expect(collectArray(normalArr1.iterator().filter({val: Rune => val == r'♬'})), Array<Rune>(10, repeat: r'♬'))
        @Expect(collectArray(normalArr1.iterator().filter({val: Rune => val != r'♬'})), Array<Rune>())
    }
}
