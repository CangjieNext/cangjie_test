/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./data
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.collection.*
import std.fs.*

var cmap = Option<TreeMap<Int64, Int64>>.None
var cmap_str = Option<TreeMap<String, String>>.None
const N: Int64 = 500
var sum = 0

@Test
class Test_treemap_02 {
    public func PreData(): Unit {
        let cmap1 = TreeMap<Int64, Int64>()
        for (i in 0..N) {
            cmap1.add(i, i + 1)
        }
        cmap = Option<TreeMap<Int64, Int64>>.Some(cmap1)
    }

    public func PreData_str(): Unit {
        let cmap1 = TreeMap<String, String>()
        for (i in 0..N) {
            cmap1.add("${i}", "${i + 1}")
        }
        cmap_str = Option<TreeMap<String, String>>.Some(cmap1)
    }

    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_01(): Unit {
        //test the first and last using Int64.
        PreData()
        let first = cmap.getOrThrow().first.getOrThrow()
        let last = cmap.getOrThrow().last.getOrThrow()
        @Expect(first[0], 0)
        @Expect(first[1], 1)
        @Expect(last[0], N-1)
        @Expect(last[1], N)
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 1})
        for ((k, v) in cmap.getOrThrow()) {
            res[k] = v
        }
        @Expect(res,resArr)
        @Expect(res.size, resArr.size)
    }

    @TestCase
    func test_02(): Unit {
        //test the first and last using String.
        PreData_str()
        let first = cmap_str.getOrThrow().first.getOrThrow()
        let last = cmap_str.getOrThrow().last.getOrThrow()
        @Expect(first[0], "0")
        @Expect(first[1], "1")
        @Expect(last[0], "99")
        @Expect(last[1], "100")
    }

    @TestCase
    func test_03(): Unit {
        //test the first and last and then compare.
        let cmap = TreeMap<String, String>()
        for (i in 0..200) {
            cmap.add("${i}", "${i + 1}")
        }
        let first = cmap.first.getOrThrow()
        let last = cmap.last.getOrThrow()
        @Expect(first[0], "0")
        @Expect(first[1], "1")
        @Expect(last[0], "99")
        @Expect(last[1], "100")
        let file = File("./data/file_treemap02.txt", Read)
        var buffer = Array<Byte>(cmap.toString().size, repeat: 0)
        file.read(buffer)
        @Expect(cmap.toString(), String.fromUtf8(buffer))
    }

    @TestCase
    func test_04(): Unit {
        //test the first and last with no element.
        let cmap = TreeMap<Int64, Int64>()
        let first = cmap.first
        let last = cmap.last
        match (first) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 1)
        match (last) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_05(): Unit {
        //test the first and last with add elements and then delete of Int64.
        PreData()
        let first = cmap.getOrThrow().first.getOrThrow()
        let last = cmap.getOrThrow().last.getOrThrow()
        @Expect(first[0], 0)
        @Expect(first[1], 1)
        @Expect(last[0], N-1)
        @Expect(last[1], N)
        for (i in 0..N) {
            cmap.getOrThrow().remove(i)
        }
        let first1 = cmap.getOrThrow().first
        let last1 = cmap.getOrThrow().last
        match (first1) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 1)
        match (last1) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_06(): Unit {
        //test the first and last with add elements and then delete of String.
        PreData_str()
        let first = cmap_str.getOrThrow().first.getOrThrow()
        let last = cmap_str.getOrThrow().last.getOrThrow()
        @Expect(first[0], "0")
        @Expect(first[1], "1")
        @Expect(last[0], "99")
        @Expect(last[1], "100")
        for (i in 0..N) {
            cmap_str.getOrThrow().remove("${i}")
        }
        let first1 = cmap_str.getOrThrow().first
        let last1 = cmap_str.getOrThrow().last
        match (first1) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 1)
        match (last1) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_07(): Unit {
        //test the first and last with add elements and then delete and then add of Int64.
        PreData()
        let first = cmap.getOrThrow().first.getOrThrow()
        let last = cmap.getOrThrow().last.getOrThrow()
        @Expect(first[0], 0)
        @Expect(first[1], 1)
        @Expect(last[0], N-1)
        @Expect(last[1], N)
        for (i in 0..N) {
            cmap.getOrThrow().remove(i)
        }
        let first1 = cmap.getOrThrow().first
        let last1 = cmap.getOrThrow().last
        match (first1) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 1)
        match (last1) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 2)
        for (i in 0..2 * N) {
            cmap.getOrThrow().add(i, i + 5)
        }
        let first2 = cmap.getOrThrow().first.getOrThrow()
        let last2 = cmap.getOrThrow().last.getOrThrow()
        @Expect(first2[0], 0)
        @Expect(first2[1], 5)
        @Expect(last2[0], 999)
        @Expect(last2[1], 1004)
    }

    @TestCase
    func test_08(): Unit {
        //test the first and last with add elements, then delete and add of String.
        PreData_str()
        let first = cmap_str.getOrThrow().first.getOrThrow()
        let last = cmap_str.getOrThrow().last.getOrThrow()
        @Expect(first[0], "0")
        @Expect(first[1], "1")
        @Expect(last[0], "99")
        @Expect(last[1], "100")
        for (i in 0..N) {
            cmap_str.getOrThrow().remove("${i}")
        }
        let first1 = cmap_str.getOrThrow().first
        let last1 = cmap_str.getOrThrow().last
        match (first1) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 1)
        match (last1) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 2)
        for (i in 0..2 * N) {
            cmap_str.getOrThrow().add("${i}", "${i + 5}")
        }
        let first2 = cmap_str.getOrThrow().first.getOrThrow()
        let last2 = cmap_str.getOrThrow().last.getOrThrow()
        @Expect(first2[0], "0")
        @Expect(first2[1], "5")
        @Expect(last2[0], "999")
        @Expect(last2[1], "1004")
    }

    @TestCase
    func test_09(): Unit {
        //test the last with add elements and then delete part query the result of Int64.
        PreData()
        let first = cmap.getOrThrow().first.getOrThrow()
        let last = cmap.getOrThrow().last.getOrThrow()
        @Expect(first[0], 0)
        @Expect(first[1], 1)
        @Expect(last[0], N-1)
        @Expect(last[1], N)
        for (i in 1..N : 2) {
            cmap.getOrThrow().remove(i)
        }
        let last1 = cmap.getOrThrow().last.getOrThrow()
        @Expect(last1[0], N-2)
        @Expect(last1[1], N-1)
    }

    @TestCase
    func test_10(): Unit {
        //test the first with add elements and then delete part query the result of Int64.
        PreData()
        let first = cmap.getOrThrow().first.getOrThrow()
        let last = cmap.getOrThrow().last.getOrThrow()
        @Expect(first[0], 0)
        @Expect(first[1], 1)
        @Expect(last[0], N-1)
        @Expect(last[1], N)
        for (i in 0..N : 2) {
            cmap.getOrThrow().remove(i)
        }
        let first1 = cmap.getOrThrow().first.getOrThrow()
        @Expect(first1[0], 1)
        @Expect(first1[1], 2)
    }

    @TestCase
    func test_11(): Unit {
        //test the first with add elements, then delete part query the result of String.
        PreData_str()
        let first = cmap_str.getOrThrow().first.getOrThrow()
        let last = cmap_str.getOrThrow().last.getOrThrow()
        @Expect(first[0], "0")
        @Expect(first[1], "1")
        @Expect(last[0], "99")
        @Expect(last[1], "100")
        for (i in 0..N : 2) {
            cmap_str.getOrThrow().remove("${i}")
        }
        let first1 = cmap_str.getOrThrow().first.getOrThrow()
        @Expect(first1[0], "1")
        @Expect(first1[1], "2")
    }

    @TestCase
    func test_12(): Unit {
        //test the last with add elements, then delete part query the result of String.
        PreData_str()
        let first = cmap_str.getOrThrow().first.getOrThrow()
        let last = cmap_str.getOrThrow().last.getOrThrow()
        @Expect(first[0], "0")
        @Expect(first[1], "1")
        @Expect(last[0], "99")
        @Expect(last[1], "100")
        for (i in 1..N : 2) {
            cmap_str.getOrThrow().remove("${i}")
        }
        let last1 = cmap_str.getOrThrow().last.getOrThrow()
        @Expect(last1[0], "98")
        @Expect(last1[1], "99")
    }
}
