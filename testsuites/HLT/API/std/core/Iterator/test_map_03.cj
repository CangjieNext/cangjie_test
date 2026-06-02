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
class Test_map_03 {
    /*
     * Test description:
     *     test the func of map set the Int
     * Test API:
     *     public func map<R>(transform: (T)-> R): Iterator<R> { ... }
     */
    @TestCase
    func test_map_01(): Unit {
        var emptyArr1: Array<Int64> = Array<Int64>()
        var normalArr1: Array<Int64> = Array<Int64>(10, {val => val * 2})
        @Expect(collectStringFunc(emptyArr1.iterator().map<Int64>({val: Int64 => 1})), "")
        @Expect(collectStringFunc(normalArr1.iterator().map<Int64>({val: Int64 => 2})), "2,2,2,2,2,2,2,2,2,2")
    }

    /*
     * Test description:
     *     test the func of map set the String
     * Test API:
     *     public func map<R>(transform: (T)-> R): Iterator<R> { ... }
     */
    @TestCase
    func test_map_02(): Unit {
        var emptyArr1: Array<Int64> = Array<Int64>()
        var normalArr1: Array<Int64> = Array<Int64>(10, repeat: 30)
        @Expect(collectArray(emptyArr1.iterator().map<String>({val: Int64 => (val / 3).toString()})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().map<String>({val: Int64 => (val / 3).toString()})), Array<String>(10, repeat: 10.toString()))
    }

    /*
     * Test description:
     *     test the func of map set the String
     * Test API:
     *     public func map<R>(transform: (T)-> R): Iterator<R> { ... }
     */
    @TestCase
    func test_map_03(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "仓颉")
        @Expect(collectArray(emptyArr1.iterator().map<String>({val: String => "仓颉test"})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().map<String>({val: String => "仓颉test"})), Array<String>(10, repeat: "仓颉test"))
    }

    /*
     * Test description:
     *     test the func of map set the String
     * Test API:
     *     public func map<R>(transform: (T)-> R): Iterator<R> { ... }
     */
    @TestCase
    func test_map_04(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "")
        @Expect(collectArray(emptyArr1.iterator().map<String>({val: String => ""})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().map<String>({val: String => ""})), Array<String>(10, repeat: ""))
    }

    /*
     * Test description:
     *     test the func of map set the String
     * Test API:
     *     public func map<R>(transform: (T)-> R): Iterator<R> { ... }
     */
    @TestCase
    func test_map_05(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "\0")
        @Expect(collectArray(emptyArr1.iterator().map<String>({val: String => "\0"})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().map<String>({val: String => "\0"})), Array<String>(10, repeat: "\0"))
    }

    /*
     * Test description:
     *     test the func of map set the String
     * Test API:
     *     public func map<R>(transform: (T)-> R): Iterator<R> { ... }
     */
    @TestCase
    func test_map_06(): Unit {
        let str_long = StringBuilder(r'a', 100000).toString()
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: str_long)
        @Expect(collectArray(emptyArr1.iterator().map<String>({val: String => str_long})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().map<String>({val: String => str_long})), Array<String>(10, repeat: str_long))
    }

    /*
     * Test description:
     *     test the func of map set the String
     * Test API:
     *     public func map<R>(transform: (T)-> R): Iterator<R> { ... }
     */
    @TestCase
    func test_map_07(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈")
        @Expect(collectArray(emptyArr1.iterator().map<String>({val: String =>"♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().map<String>({val: String => "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"})), Array<String>(10, repeat: "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"))
    }

    /*
     * Test description:
     *     test the func of map set the Float
     * Test API:
     *     public func map<R>(transform: (T)-> R): Iterator<R> { ... }
     */
    @TestCase
    func test_map_08(): Unit {
        var emptyArr1: Array<Float64> = Array<Float64>()
        var normalArr1: Array<Float64> = Array<Float64>(10, repeat: Float64(1.11111))
        @Expect(collectArray(emptyArr1.iterator().map<Float64>({val: Float64 => Float64(1.11111)})), Array<Float64>())
        @Expect(collectArray(normalArr1.iterator().map<Float64>({val: Float64 => Float64(1.11111)})), Array<Float64>(10, repeat: Float64(1.11111)))
    }

    /*
     * Test description:
     *     test the func of map set the Rune
     * Test API:
     *     public func map<R>(transform: (T)-> R): Iterator<R> { ... }
     */
    @TestCase
    func test_map_09(): Unit {
        var emptyArr1: Array<Rune> = Array<Rune>()
        var normalArr1: Array<Rune> = Array<Rune>(10, repeat: r'♬')
        @Expect(collectArray(emptyArr1.iterator().map<Rune>({val: Rune => r'倉'})), Array<Rune>())
        @Expect(collectArray(normalArr1.iterator().map<Rune>({val: Rune => r'倉'})), Array<Rune>(10, repeat: r'倉'))
    }
}
