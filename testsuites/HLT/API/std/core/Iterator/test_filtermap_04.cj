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
class Test_filtermap_04 {
    /*
     * Test description:
     *     test the func of filterMap set the Int
     * Test API:
     *     public func filterMap<R>(transform: (T)-> Option<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_filterMap_01(): Unit {
        var emptyArr1: Array<Int64> = Array<Int64>()
        var normalArr1: Array<Int64> = Array<Int64>(10, {val => val * 2})
        @Expect(collectStringFunc(emptyArr1.iterator().filterMap<Int64>({val: Int64 => 1})), "")
        @Expect(collectStringFunc(normalArr1.iterator().filterMap<Int64>({val: Int64 => 2})), "2,2,2,2,2,2,2,2,2,2")
    }

    /*
     * Test description:
     *     test the func of filterMap set the String
     * Test API:
     *     public func filterMap<R>(transform: (T)-> Option<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_filterMap_02(): Unit {
        var emptyArr1: Array<Int64> = Array<Int64>()
        var normalArr1: Array<Int64> = Array<Int64>(10, repeat: 30)
        @Expect(collectArray(emptyArr1.iterator().filterMap<String>({val: Int64 => (val / 3).toString()})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().filterMap<String>({val: Int64 => (val / 3).toString()})), Array<String>(10, repeat: 10.toString()))
    }

    /*
     * Test description:
     *     test the func of filterMap set the String
     * Test API:
     *     public func filterMap<R>(transform: (T)-> Option<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_filterMap_03(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "仓颉")
        @Expect(collectArray(emptyArr1.iterator().filterMap<String>({val: String => "仓颉test"})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().filterMap<String>({val: String => "仓颉test"})), Array<String>(10, repeat: "仓颉test"))
    }

    /*
     * Test description:
     *     test the func of filterMap set the String
     * Test API:
     *     public func filterMap<R>(transform: (T)-> Option<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_filterMap_04(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "")
        @Expect(collectArray(emptyArr1.iterator().filterMap<String>({val: String => ""})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().filterMap<String>({val: String => ""})), Array<String>(10, repeat: ""))
    }

    /*
     * Test description:
     *     test the func of filterMap set the String
     * Test API:
     *     public func filterMap<R>(transform: (T)-> Option<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_filterMap_05(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "\0")
        @Expect(collectArray(emptyArr1.iterator().filterMap<String>({val: String => "\0"})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().filterMap<String>({val: String => "\0"})), Array<String>(10, repeat: "\0"))
    }

    /*
     * Test description:
     *     test the func of filterMap set the String
     * Test API:
     *     public func filterMap<R>(transform: (T)-> Option<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_filterMap_06(): Unit {
        let str_long = StringBuilder(r'a', 100000).toString()
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: str_long)
        @Expect(collectArray(emptyArr1.iterator().filterMap<String>({val: String => str_long})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().filterMap<String>({val: String => str_long})), Array<String>(10, repeat: str_long))
    }

    /*
     * Test description:
     *     test the func of filterMap set the String
     * Test API:
     *     public func filterMap<R>(transform: (T)-> Option<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_filterMap_07(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈")
        @Expect(collectArray(emptyArr1.iterator().filterMap<String>({val: String =>"♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().filterMap<String>({val: String => "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"})), Array<String>(10, repeat: "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"))
    }

    /*
     * Test description:
     *     test the func of filterMap set the Float64
     * Test API:
     *     public func filterMap<R>(transform: (T)-> Option<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_filterMap_08(): Unit {
        var emptyArr1: Array<Float64> = Array<Float64>()
        var normalArr1: Array<Float64> = Array<Float64>(10, repeat: Float64(1.11111))
        @Expect(collectArray(emptyArr1.iterator().filterMap<Float64>({val: Float64 => Float64(1.11111)})), Array<Float64>())
        @Expect(collectArray(normalArr1.iterator().filterMap<Float64>({val: Float64 => Float64(1.11111)})), Array<Float64>(10, repeat: Float64(1.11111)))
    }

    /*
     * Test description:
     *     test the func of filterMap set the Rune
     * Test API:
     *     public func filterMap<R>(transform: (T)-> Option<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_filterMap_09(): Unit {
        var emptyArr1: Array<Rune> = Array<Rune>()
        var normalArr1: Array<Rune> = Array<Rune>(10, repeat: r'♬')
        @Expect(collectArray(emptyArr1.iterator().filterMap<Rune>({val: Rune => r'倉'})), Array<Rune>())
        @Expect(collectArray(normalArr1.iterator().filterMap<Rune>({val: Rune => r'倉'})), Array<Rune>(10, repeat: r'倉'))
    }
}
