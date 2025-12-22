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
class Test_concat_07 {
    /*
     * Test description:
     *     test the func of concat set the Int
     * Test API:
     *     public func concat(it: Iterator<T>): Iterator<T> { ... }
     */
    @TestCase
    func test_concat_01(): Unit {
        let normalArr1: Array<Int64> = Array<Int64>(5, repeat: 0)
        let normalArr2: Array<Int64> = Array<Int64>(5, repeat: 1)
        @Expect(collectArray<Int64>(normalArr1.iterator().concat(normalArr2.iterator())), [0,0,0,0,0,1,1,1,1,1])
    }

    /*
     * Test description:
     *     test the func of concat set the String
     * Test API:
     *     public func concat(it: Iterator<T>): Iterator<T> { ... }
     */
    @TestCase
    func test_concat_02(): Unit {
        let normalArr1: Array<String> = Array<String>(5, repeat: "0")
        let normalArr2: Array<String> = Array<String>(5, repeat: "1")
        @Expect(collectArray(normalArr1.iterator().concat(normalArr2.iterator())), 
           ["0","0","0","0","0","1","1","1","1","1"])
    }

    /*
     * Test description:
     *     test the func of concat set the String
     * Test API:
     *     public func concat(it: Iterator<T>): Iterator<T> { ... }
     */
    @TestCase
    func test_concat_03(): Unit {
        let normalArr1: Array<String> = Array<String>(5, repeat: "仓颉")
        let normalArr2: Array<String> = Array<String>(5, repeat: "鸿蒙")
        @Expect(collectArray(normalArr1.iterator().concat(normalArr2.iterator())), 
           ["仓颉","仓颉","仓颉","仓颉","仓颉","鸿蒙","鸿蒙","鸿蒙","鸿蒙","鸿蒙"])
    }

    /*
     * Test description:
     *     test the func of concat set the String
     * Test API:
     *     public func concat(it: Iterator<T>): Iterator<T> { ... }
     */
    @TestCase
    func test_concat_04(): Unit {
        let normalArr1: Array<String> = Array<String>(5, repeat: "")
        let normalArr2: Array<String> = Array<String>(5, repeat: "")
        @Expect(collectArray(normalArr1.iterator().concat(normalArr2.iterator())), 
            Array<String>(10, repeat:""))
    }

    /*
     * Test description:
     *     test the func of concat set the String
     * Test API:
     *     public func concat(it: Iterator<T>): Iterator<T> { ... }
     */
    @TestCase
    func test_concat_05(): Unit {
        let normalArr1: Array<String> = Array<String>(5, repeat: "\0")
        let normalArr2: Array<String> = Array<String>(5, repeat: "\0")
        @Expect(collectArray(normalArr1.iterator().concat(normalArr2.iterator())), 
            Array<String>(10, repeat:"\0"))
    }

    /*
     * Test description:
     *     test the func of concat set the String
     * Test API:
     *     public func concat(it: Iterator<T>): Iterator<T> { ... }
     */
    @TestCase
    func test_concat_06(): Unit {
        let str_long = StringBuilder(r'a', 100000).toString()
        let normalArr1: Array<String> = Array<String>(5, repeat: str_long)
        let normalArr2: Array<String> = Array<String>(5, repeat: str_long)
        @Expect(collectArray(normalArr1.iterator().concat(normalArr2.iterator())), 
            Array<String>(10, repeat: str_long))
    }

    /*
     * Test description:
     *     test the func of concat set the String
     * Test API:
     *     public func concat(it: Iterator<T>): Iterator<T> { ... }
     */
    @TestCase
    func test_concat_07(): Unit {
        let normalArr1: Array<String> = Array<String>(5, repeat: "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈")
        let normalArr2: Array<String> = Array<String>(5, repeat: "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈")
        @Expect(collectArray(normalArr1.iterator().concat(normalArr2.iterator())), 
            Array<String>(10, repeat: "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"))
    }

    /*
     * Test description:
     *     test the func of concat set the Float64
     * Test API:
     *     public func concat(it: Iterator<T>): Iterator<T> { ... }
     */
    @TestCase
    func test_concat_08(): Unit {
        let normalArr1: Array<Float64> = Array<Float64>(5, repeat: Float64(1.11111))
        let normalArr2: Array<Float64> = Array<Float64>(5, repeat: Float64(1.11111))
        @Expect(collectArray(normalArr1.iterator().concat(normalArr2.iterator())), 
            Array<Float64>(10, repeat: Float64(1.11111)))
    }

    /*
     * Test description:
     *     test the func of concat set the Rune
     * Test API:
     *     public func concat(it: Iterator<T>): Iterator<T> { ... }
     */
    @TestCase
    func test_concat_09(): Unit {
        let normalArr1: Array<Rune> = Array<Rune>(5, repeat: r'♬')
        let normalArr2: Array<Rune> = Array<Rune>(5, repeat: r'♬')
        @Expect(collectArray(normalArr1.iterator().concat(normalArr2.iterator())), 
            Array<Rune>(10, repeat: r'♬'))
    }
}
