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
class Test_inspect_11 {
    /*
     * Test description:
     *     test the func of inspect set the Int
     * Test API:
     *     public func inspect(action: (T)->Unit): Iterator<T> { ... }
     */
    @TestCase
    func test_inspect_01(): Unit {
        let emptyArr1: Array<Int64> = Array<Int64>()
        let normalArr1: Array<Int64> = Array<Int64>(10, {val => val * 2})
        collectArray(emptyArr1.iterator().inspect({val: Int64 => emptyArr1[val / 2] -= 1}))
        collectArray(normalArr1.iterator().inspect({val: Int64 => normalArr1[val / 2] -= 1}))
        @Expect(emptyArr1, Array<Int64>())
        @Expect(normalArr1, [-1, 1, 3, 5, 7, 9, 11, 13, 15, 17])
    }

    /*
     * Test description:
     *     test the func of inspect set the String
     * Test API:
     *     public func inspect(action: (T)->Unit): Iterator<T> { ... }
     */
    @TestCase
    func test_inspect_02(): Unit {
        let normalArr1: Array<String> = Array<String>(10, repeat: "cangjie")
        for (i in 0..10) {
            collectArray(normalArr1.iterator().inspect({val: String => normalArr1[i] = "hongmeng"}))
        }
        @Expect(normalArr1, Array<String>(10, repeat: "hongmeng"))
    }

    /*
     * Test description:
     *     test the func of inspect set the String
     * Test API:
     *     public func inspect(action: (T)->Unit): Iterator<T> { ... }
     */
    @TestCase
    func test_inspect_03(): Unit {
        let normalArr1: Array<String> = Array<String>(10, repeat: "仓颉")
        for (i in 0..10) {
            collectArray(normalArr1.iterator().inspect({val: String => normalArr1[i] = "鸿蒙"}))
        }
        @Expect(normalArr1, Array<String>(10, repeat: "鸿蒙"))
    }

    /*
     * Test description:
     *     test the func of inspect set the String
     * Test API:
     *     public func inspect(action: (T)->Unit): Iterator<T> { ... }
     */
    @TestCase
    func test_inspect_04(): Unit {
        let normalArr1: Array<String> = Array<String>(10, repeat: "")
        for (i in 0..10) {
            collectArray(normalArr1.iterator().inspect({val: String => normalArr1[i] = "cangjie"}))
        }
        @Expect(normalArr1, Array<String>(10, repeat: "cangjie"))
    }

    /*
     * Test description:
     *     test the func of inspect set the String
     * Test API:
     *     public func inspect(action: (T)->Unit): Iterator<T> { ... }
     */
    @TestCase
    func test_inspect_05(): Unit {
        let normalArr1: Array<String> = Array<String>(10, repeat: "")
        for (i in 0..10) {
            collectArray(normalArr1.iterator().inspect({val: String => normalArr1[i] = "\0"}))
        }
        @Expect(normalArr1, Array<String>(10, repeat: "\0"))
    }

    /*
     * Test description:
     *     test the func of inspect set the String
     * Test API:
     *     public func inspect(action: (T)->Unit): Iterator<T> { ... }
     */
    @TestCase
    func test_inspect_06(): Unit {
        let str_long = StringBuilder(r'a', 100000).toString()
        let normalArr1: Array<String> = Array<String>(10, repeat: "")
        for (i in 0..10) {
            collectArray(normalArr1.iterator().inspect({val: String => normalArr1[i] = str_long}))
        }
        @Expect(normalArr1, Array<String>(10, repeat: str_long))
    }

    /*
     * Test description:
     *     test the func of inspect set the String
     * Test API:
     *     public func inspect(action: (T)->Unit): Iterator<T> { ... }
     */
    @TestCase
    func test_inspect_07(): Unit {
        let normalArr1: Array<String> = Array<String>(10, repeat: "cangjie")
        for (i in 0..10) {
            collectArray(normalArr1.iterator().inspect({val: String => normalArr1[i] = "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"}))
        }
        @Expect(normalArr1, Array<String>(10, repeat: "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈"))
    }

    /*
     * Test description:
     *     test the func of inspect set the Float64
     * Test API:
     *     public func inspect(action: (T)->Unit): Iterator<T> { ... }
     */
    @TestCase
    func test_inspect_08(): Unit {
        let normalArr1: Array<Float64> = Array<Float64>(10, repeat: Float64(1.11111))
        for (i in 0..10) {
            collectArray(normalArr1.iterator().inspect({val: Float64 => normalArr1[i] = Float64(1.11112)}))
        }
        @Expect(normalArr1, Array<Float64>(10, repeat: Float64(1.11112)))
    }

    /*
     * Test description:
     *     test the func of inspect set the Rune
     * Test API:
     *     public func inspect(action: (T)->Unit): Iterator<T> { ... }
     */
    @TestCase
    func test_inspect_09(): Unit {
        let emptyArr1: Array<Rune> = Array<Rune>()
        let normalArr1: Array<Rune> = Array<Rune>(10, repeat: r'♬')
        for (i in 0..10) {
            collectArray(normalArr1.iterator().inspect({val: Rune => normalArr1[i] = r'爲'}))
        }
        @Expect(normalArr1, Array<Rune>(10, repeat: r'爲'))
    }
}
