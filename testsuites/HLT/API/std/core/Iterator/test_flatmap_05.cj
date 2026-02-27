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
class Test_flatmap_05 {
    /*
     * Test description:
     *     test the func of flatMap set the Int
     * Test API:
     *     public func flatMap<R>(transform: (T)-> Iterator<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_flatmap_01(): Unit {
        var emptyArr1: Array<Array<Int64>> = [[]]
        var normalArr1: Array<Array<Int64>> = [[1, 2, 3], [], [4, 5, 6]]
        @Expect(collectArray<Int64>(emptyArr1.iterator().flatMap<Int64>({ item => item.iterator()})), [])
        @Expect(collectArray<Int64>(normalArr1.iterator().flatMap<Int64>({ item => item.iterator()})), [1,2,3,4,5,6])
    }

    /*
     * Test description:
     *     test the func of flatMap set the String
     * Test API:
     *     public func flatMap<R>(transform: (T)-> Iterator<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_flatmap_02(): Unit {
        var emptyArr1: Array<Array<String>> = [[]]
        var normalArr1: Array<Array<String>> = [["1", "2", "3"], [], ["4", "5", "6"]]
        @Expect(collectArray<String>(emptyArr1.iterator().flatMap<String>({ item => item.iterator()})), [])
        @Expect(collectArray<String>(normalArr1.iterator().flatMap<String>({ item => item.iterator()})), ["1","2","3","4","5","6"])
    }

    /*
     * Test description:
     *     test the func of flatMap set the String
     * Test API:
     *     public func flatMap<R>(transform: (T)-> Iterator<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_flatmap_03(): Unit {
        var emptyArr1: Array<Array<String>> = [[]]
        var normalArr1: Array<Array<String>> = [["1", "2", "3"], [], ["仓颉"], ["4", "5", "鸿蒙"]]
        @Expect(collectArray<String>(emptyArr1.iterator().flatMap<String>({ item => item.iterator()})), [])
        @Expect(collectArray<String>(normalArr1.iterator().flatMap<String>({ item => item.iterator()})), ["1","2","3","仓颉","4","5","鸿蒙"])
    }

    /*
     * Test description:
     *     test the func of flatMap set the String
     * Test API:
     *     public func flatMap<R>(transform: (T)-> Iterator<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_flatmap_04(): Unit {
        var emptyArr1: Array<Array<String>> = [[]]
        var normalArr1: Array<Array<String>> = [["1", "2", "3"], [], [""], ["4", "5", ""]]
        @Expect(collectArray<String>(emptyArr1.iterator().flatMap<String>({ item => item.iterator()})), [])
        @Expect(collectArray<String>(normalArr1.iterator().flatMap<String>({ item => item.iterator()})), ["1","2","3","","4","5",""])
    }

    /*
     * Test description:
     *     test the func of flatMap set the String
     * Test API:
     *     public func flatMap<R>(transform: (T)-> Iterator<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_flatmap_05(): Unit {
        var emptyArr1: Array<Array<String>> = [[]]
        var normalArr1: Array<Array<String>> = [["\0", "2", "\0"], [], [""], ["4", "5", ""]]
        @Expect(collectArray<String>(emptyArr1.iterator().flatMap<String>({ item => item.iterator()})), [])
        @Expect(collectArray<String>(normalArr1.iterator().flatMap<String>({ item => item.iterator()})), ["\0","2","\0","","4","5",""])
    }

    /*
     * Test description:
     *     test the func of flatMap set the Int
     * Test API:
     *     public func flatMap<R>(transform: (T)-> Iterator<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_flatmap_06(): Unit {
        let str_long = StringBuilder(r'a', 100000).toString()
        var emptyArr1: Array<Array<String>> = [[]]
        var normalArr1: Array<Array<String>> = [[str_long, "2", "\0"], [], [""], ["4", "5", ""]]
        @Expect(collectArray<String>(emptyArr1.iterator().flatMap<String>({ item => item.iterator()})), [])
        @Expect(collectArray<String>(normalArr1.iterator().flatMap<String>({ item => item.iterator()})), [str_long,"2","\0","","4","5",""])
    }

    /*
     * Test description:
     *     test the func of flatMap set the Int
     * Test API:
     *     public func flatMap<R>(transform: (T)-> Iterator<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_flatmap_07(): Unit {
        var emptyArr1: Array<Array<String>> = [[]]
        var normalArr1: Array<Array<String>> = [["♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈", "2", "\0"], [], [""], ["4", "5", ""]]
        @Expect(collectArray<String>(emptyArr1.iterator().flatMap<String>({ item => item.iterator()})), [])
        @Expect(collectArray<String>(normalArr1.iterator().flatMap<String>({ item => item.iterator()})), ["♫♬♪♩✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆❇❈","2","\0","","4","5",""])
    }

    /*
     * Test description:
     *     test the func of flatMap set the Float64
     * Test API:
     *     public func flatMap<R>(transform: (T)-> Iterator<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_flatmap_08(): Unit {
        var emptyArr1: Array<Array<Float64>> = [[]]
        var normalArr1: Array<Array<Float64>> = [[Float64(1.11111)], [], [Float64(-1.11111)]]
        @Expect(collectArray<Float64>(emptyArr1.iterator().flatMap<Float64>({ item => item.iterator()})), [])
        @Expect(collectArray<Float64>(normalArr1.iterator().flatMap<Float64>({ item => item.iterator()})), [Float64(1.11111), Float64(-1.11111)])
    }

    /*
     * Test description:
     *     test the func of flatMap set the Rune
     * Test API:
     *     public func flatMap<R>(transform: (T)-> Iterator<R>): Iterator<R> { ... }
     */
    @TestCase
    func test_flatmap_09(): Unit {
        var emptyArr1: Array<Array<Rune>> = [[]]
        var normalArr1: Array<Array<Rune>> = [[r'♬'], [], [r'倉']]
        @Expect(collectArray<Rune>(emptyArr1.iterator().flatMap<Rune>({ item => item.iterator()})), [])
        @Expect(collectArray<Rune>(normalArr1.iterator().flatMap<Rune>({ item => item.iterator()})), [r'♬', r'倉'])
    }
}
