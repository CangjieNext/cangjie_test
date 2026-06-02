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
class Test_zip_06 {
    /*
     * Test description:
     *     test the func of zip set the Int
     * Test API:
     *     public func zip<R>(it: Iterator<R>): Iterator<(T, R)> { ... }
     */
    @TestCase
    func test_zip_01(): Unit {
        let normalArr1: Array<Int64> = Array<Int64>(5, repeat: 0)
        let normalArr2: Array<Int64> = Array<Int64>(5, repeat: 1)
        @Expect(collectHashMap<Int64, Int64>(normalArr1.iterator().zip<Int64>(normalArr2.iterator())),
            HashMap<Int64, Int64>([(0, 1), (0, 1), (0, 1), (0, 1), (0, 1)]))
    }

    /*
     * Test description:
     *     test the func of zip set the String
     * Test API:
     *     public func zip<R>(it: Iterator<R>): Iterator<(T, R)> { ... }
     */
    @TestCase
    func test_zip_02(): Unit {
        let normalArr1: Array<Int64> = Array<Int64>(5, repeat: 0)
        let normalArr2: Array<String> = Array<String>(5, repeat: "1")
        @Expect(collectHashMap<Int64, String>(normalArr1.iterator().zip<String>(normalArr2.iterator())),
            HashMap<Int64, String>([(0, "1"), (0, "1"), (0, "1"), (0, "1"), (0, "1")]))
    }

    /*
     * Test description:
     *     test the func of zip set the String
     * Test API:
     *     public func zip<R>(it: Iterator<R>): Iterator<(T, R)> { ... }
     */
    @TestCase
    func test_zip_03(): Unit {
        let normalArr1: Array<Int64> = Array<Int64>(5, repeat: 0)
        let normalArr2: Array<String> = Array<String>(5, repeat: "仓颉鸿蒙")
        @Expect(collectHashMap<Int64, String>(normalArr1.iterator().zip<String>(normalArr2.iterator())),
            HashMap<Int64, String>([(0, "仓颉鸿蒙"), (0, "仓颉鸿蒙"), (0, "仓颉鸿蒙"), (0, "仓颉鸿蒙"), (0, "仓颉鸿蒙")]))
    }

    /*
     * Test description:
     *     test the func of zip set the String
     * Test API:
     *     public func zip<R>(it: Iterator<R>): Iterator<(T, R)> { ... }
     */
    @TestCase
    func test_zip_04(): Unit {
        let normalArr1: Array<Int64> = Array<Int64>(5, repeat: 0)
        let normalArr2: Array<String> = Array<String>(5, repeat: "")
        @Expect(collectHashMap<Int64, String>(normalArr1.iterator().zip<String>(normalArr2.iterator())),
            HashMap<Int64, String>([(0, ""), (0, ""), (0, ""), (0, ""), (0, "")]))
    }

    /*
     * Test description:
     *     test the func of zip set the String
     * Test API:
     *     public func zip<R>(it: Iterator<R>): Iterator<(T, R)> { ... }
     */
    @TestCase
    func test_zip_05(): Unit {
        let normalArr1: Array<Int64> = Array<Int64>(5, repeat: 0)
        let normalArr2: Array<String> = Array<String>(5, repeat: "\0")
        @Expect(collectHashMap<Int64, String>(normalArr1.iterator().zip<String>(normalArr2.iterator())),
            HashMap<Int64, String>([(0, "\0"), (0, "\0"), (0, "\0"), (0, "\0"), (0, "\0")]))
    }

    /*
     * Test description:
     *     test the func of zip set the String
     * Test API:
     *     public func zip<R>(it: Iterator<R>): Iterator<(T, R)> { ... }
     */
    @TestCase
    func test_zip_06(): Unit {
        let str_long = StringBuilder(r'a', 100000).toString()
        let normalArr1: Array<Int64> = Array<Int64>(5, repeat: 0)
        let normalArr2: Array<String> = Array<String>(5, repeat: str_long)
        @Expect(collectHashMap<Int64, String>(normalArr1.iterator().zip<String>(normalArr2.iterator())),
            HashMap<Int64, String>([(0, str_long), (0, str_long), (0, str_long), (0, str_long), (0, str_long)]))
    }

    /*
     * Test description:
     *     test the func of zip set the String
     * Test API:
     *     public func zip<R>(it: Iterator<R>): Iterator<(T, R)> { ... }
     */
    @TestCase
    func test_zip_07(): Unit {
        let normalArr1: Array<Int64> = Array<Int64>(5, repeat: 0)
        let normalArr2: Array<String> = Array<String>(2, repeat: "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈")
        println(collectHashMap<Int64, String>(normalArr1.iterator().zip<String>(normalArr2.iterator())))
        @Expect(collectHashMap<Int64, String>(normalArr1.iterator().zip<String>(normalArr2.iterator())),
            HashMap<Int64, String>([(0, "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"), (0, "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈")]))
    }

    /*
     * Test description:
     *     test the func of zip set the Float64
     * Test API:
     *     public func zip<R>(it: Iterator<R>): Iterator<(T, R)> { ... }
     */
    @TestCase
    func test_zip_08(): Unit {
        let normalArr1: Array<Int64> = Array<Int64>(5, repeat: 0)
        let normalArr2: Array<Float64> = Array<Float64>(3, repeat: Float64(1.1111111))
        println(collectHashMap<Int64, Float64>(normalArr1.iterator().zip<Float64>(normalArr2.iterator())))
        @Expect(collectHashMap<Int64, Float64>(normalArr1.iterator().zip<Float64>(normalArr2.iterator())),
            HashMap<Int64, Float64>([(0, Float64(1.1111111)), (0, Float64(1.1111111)), (0, Float64(1.1111111))]))
    }

    /*
     * Test description:
     *     test the func of zip set the Rune
     * Test API:
     *     public func zip<R>(it: Iterator<R>): Iterator<(T, R)> { ... }
     */
    @TestCase
    func test_zip_09(): Unit {
        let normalArr1: Array<Int64> = Array<Int64>(5, repeat: 0)
        let normalArr2: Array<Rune> = Array<Rune>(6, repeat: r'♬')
        println(collectHashMap<Int64, Rune>(normalArr1.iterator().zip<Rune>(normalArr2.iterator())))
        @Expect(collectHashMap<Int64, Rune>(normalArr1.iterator().zip<Rune>(normalArr2.iterator())),
            HashMap<Int64, Rune>([(0, r'♬'), (0, r'♬'), (0, r'♬'), (0, r'♬'), (0, r'♬')]))
    }
}
