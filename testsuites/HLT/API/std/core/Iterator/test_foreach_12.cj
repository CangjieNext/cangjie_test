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
class Test_foreach_11 {
    /*
     * Test description:
     *     test the func of forEach set the Int
     * Test API:
     *     public func forEach(action: (T)-> Unit): Unit { ... }
     */
    @TestCase
    func test_foreach_01(): Unit {
        var emptyArr1: Array<Int64> = Array<Int64>()
        var normalArr1: Array<Int64> = Array<Int64>(10, repeat: 1)
        let bufferArrList1: ArrayList<Int64> = ArrayList<Int64>()
        emptyArr1.iterator().forEach({
            item: Int64 => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), emptyArr1)
        bufferArrList1.clear()
        normalArr1.iterator().forEach({
            item: Int64 => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), normalArr1)
    }

    /*
     * Test description:
     *     test the func of forEach set the String
     * Test API:
     *     public func forEach(action: (T)-> Unit): Unit { ... }
     */
    @TestCase
    func test_foreach_02(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "1")
        let bufferArrList1: ArrayList<String> = ArrayList<String>()
        emptyArr1.iterator().forEach({
            item: String => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), emptyArr1)
        bufferArrList1.clear()
        normalArr1.iterator().forEach({
            item: String => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), normalArr1)
    }

    /*
     * Test description:
     *     test the func of forEach set the String
     * Test API:
     *     public func forEach(action: (T)-> Unit): Unit { ... }
     */
    @TestCase
    func test_foreach_03(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "仓颉")
        let bufferArrList1: ArrayList<String> = ArrayList<String>()
        emptyArr1.iterator().forEach({
            item: String => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), emptyArr1)
        bufferArrList1.clear()
        normalArr1.iterator().forEach({
            item: String => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), normalArr1)
    }

    /*
     * Test description:
     *     test the func of forEach set the String
     * Test API:
     *     public func forEach(action: (T)-> Unit): Unit { ... }
     */
    @TestCase
    func test_foreach_04(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "")
        let bufferArrList1: ArrayList<String> = ArrayList<String>()
        emptyArr1.iterator().forEach({
            item: String => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), emptyArr1)
        bufferArrList1.clear()
        normalArr1.iterator().forEach({
            item: String => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), normalArr1)
    }

    /*
     * Test description:
     *     test the func of forEach set the String
     * Test API:
     *     public func forEach(action: (T)-> Unit): Unit { ... }
     */
    @TestCase
    func test_foreach_05(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "\0")
        let bufferArrList1: ArrayList<String> = ArrayList<String>()
        emptyArr1.iterator().forEach({
            item: String => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), emptyArr1)
        bufferArrList1.clear()
        normalArr1.iterator().forEach({
            item: String => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), normalArr1)
    }

    /*
     * Test description:
     *     test the func of forEach set the String
     * Test API:
     *     public func forEach(action: (T)-> Unit): Unit { ... }
     */
    @TestCase
    func test_foreach_06(): Unit {
        let str_long = StringBuilder(r'a', 100000).toString()
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: str_long)
        let bufferArrList1: ArrayList<String> = ArrayList<String>()
        emptyArr1.iterator().forEach({
            item: String => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), emptyArr1)
        bufferArrList1.clear()
        normalArr1.iterator().forEach({
            item: String => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), normalArr1)
    }

    /*
     * Test description:
     *     test the func of forEach set the String
     * Test API:
     *     public func forEach(action: (T)-> Unit): Unit { ... }
     */
    @TestCase
    func test_foreach_07(): Unit {
        var emptyArr1: Array<String> = Array<String>()
        var normalArr1: Array<String> = Array<String>(10, repeat: "♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈")
        let bufferArrList1: ArrayList<String> = ArrayList<String>()
        emptyArr1.iterator().forEach({
            item: String => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), emptyArr1)
        bufferArrList1.clear()
        normalArr1.iterator().forEach({
            item: String => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), normalArr1)
    }

    /*
     * Test description:
     *     test the func of forEach set the Float64
     * Test API:
     *     public func forEach(action: (T)-> Unit): Unit { ... }
     */
    @TestCase
    func test_foreach_08(): Unit {
        var emptyArr1: Array<Float64> = Array<Float64>()
        var normalArr1: Array<Float64> = Array<Float64>(10, repeat: Float64(1.11111))
        let bufferArrList1: ArrayList<Float64> = ArrayList<Float64>()
        emptyArr1.iterator().forEach({
            item: Float64 => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), emptyArr1)
        bufferArrList1.clear()
        normalArr1.iterator().forEach({
            item: Float64 => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), normalArr1)
    }

    /*
     * Test description:
     *     test the func of forEach set the Rune
     * Test API:
     *     public func forEach(action: (T)-> Unit): Unit { ... }
     */
    @TestCase
    func test_foreach_09(): Unit {
        var emptyArr1: Array<Rune> = Array<Rune>()
        var normalArr1: Array<Rune> = Array<Rune>(10, repeat: r'♬')
        let bufferArrList1: ArrayList<Rune> = ArrayList<Rune>()
        emptyArr1.iterator().forEach({
            item: Rune => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), emptyArr1)
        bufferArrList1.clear()
        normalArr1.iterator().forEach({
            item: Rune => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), normalArr1)
    }
}
