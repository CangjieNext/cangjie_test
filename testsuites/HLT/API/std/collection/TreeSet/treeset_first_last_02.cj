/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2 
// DEPENDENCE: ./data
// EXEC: %compiler %cmp_opt -o %output %f --test
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*
import std.fs.*

var cmap = Option<TreeSet<Int64>>.None
var cmap_str = Option<TreeSet<String>>.None
const N: Int64 = 500
var sum = 0

@Test
class Test_treeset_first_last_02 {
    public func PreData(): Unit {
        let cmap1 = TreeSet<Int64>()
        for (i in 0..N) {
            cmap1.add(i)
        }
        cmap = Option<TreeSet<Int64>>.Some(cmap1)
    }

    public func PreData_str(): Unit {
        let cmap1 = TreeSet<String>()
        for (i in 0..N) {
            cmap1.add("${i}")
        }
        cmap_str = Option<TreeSet<String>>.Some(cmap1)
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
        @Expect(first, 0)
        @Expect(last, N-1)
        let resArr = Array<Int64>(N, {i => i})
        @Expect(cmap.getOrThrow().toArray(), resArr)
    }

    @TestCase
    func test_02(): Unit {
        //test the first and last using String.
        PreData_str()
        let first = cmap_str.getOrThrow().first.getOrThrow()
        let last = cmap_str.getOrThrow().last.getOrThrow()
        @Expect(first, "0")
        @Expect(last, "99")
    }

    @TestCase
    func test_03(): Unit {
        //test the first and last and then compare.
        let cmap = TreeSet<String>()
        for (i in 0..200) {
            cmap.add("${i}")
        }
        let first = cmap.first.getOrThrow()
        let last = cmap.last.getOrThrow()
        @Expect(first, "0")
        @Expect(last, "99")
        let file = File("./data/file_treemap02.txt", Read)
        var buffer = Array<Byte>(cmap.toString().size, repeat: 0)
        file.read(buffer)
        @Expect(cmap.toString(), String.fromUtf8(buffer))
    }

    @TestCase
    func test_04(): Unit {
        //test the first and last with no element.
        let cmap = TreeSet<Int64>()
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
        @Expect(first, 0)
        @Expect(last, N-1)
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
        @Expect(first, "0")
        @Expect(last, "99")
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
        @Expect(first, 0)
        @Expect(last, N-1)
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
            cmap.getOrThrow().add(i)
        }
        let first2 = cmap.getOrThrow().first.getOrThrow()
        let last2 = cmap.getOrThrow().last.getOrThrow()
        @Expect(first2, 0)
        @Expect(last2, 999)
    }

    @TestCase
    func test_08(): Unit {
        //test the first and last with add elements, then delete and add of String.
        PreData_str()
        let first = cmap_str.getOrThrow().first.getOrThrow()
        let last = cmap_str.getOrThrow().last.getOrThrow()
        @Expect(first, "0")
        @Expect(last, "99")
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
            cmap_str.getOrThrow().add("${i}")
        }
        let first2 = cmap_str.getOrThrow().first.getOrThrow()
        let last2 = cmap_str.getOrThrow().last.getOrThrow()
        @Expect(first2, "0")
        @Expect(last2, "999")
    }

    @TestCase
    func test_09(): Unit {
        //test the last with add elements and then delete part query the result of Int64.
        PreData()
        let first = cmap.getOrThrow().first.getOrThrow()
        let last = cmap.getOrThrow().last.getOrThrow()
        @Expect(first, 0)
        @Expect(last, N-1)
        for (i in 1..N : 2) {
            cmap.getOrThrow().remove(i)
        }
        let last1 = cmap.getOrThrow().last.getOrThrow()
        @Expect(last1, N-2)
    }

    @TestCase
    func test_10(): Unit {
        //test the first with add elements and then delete part query the result of Int64.
        PreData()
        let first = cmap.getOrThrow().first.getOrThrow()
        let last = cmap.getOrThrow().last.getOrThrow()
        @Expect(first, 0)
        @Expect(last, N-1)
        for (i in 0..N : 2) {
            cmap.getOrThrow().remove(i)
        }
        let first1 = cmap.getOrThrow().first.getOrThrow()
        @Expect(first1, 1)
    }

    @TestCase
    func test_11(): Unit {
        //test the first with add elements, then delete part query the result of String.
        PreData_str()
        let first = cmap_str.getOrThrow().first.getOrThrow()
        let last = cmap_str.getOrThrow().last.getOrThrow()
        @Expect(first, "0")
        @Expect(last, "99")
        for (i in 0..N : 2) {
            cmap_str.getOrThrow().remove("${i}")
        }
        let first1 = cmap_str.getOrThrow().first.getOrThrow()
        @Expect(first1, "1")
    }

    @TestCase
    func test_12(): Unit {
        //test the last with add elements, then delete part query the result of String.
        PreData_str()
        let first = cmap_str.getOrThrow().first.getOrThrow()
        let last = cmap_str.getOrThrow().last.getOrThrow()
        @Expect(first, "0")
        @Expect(last, "99")
        for (i in 1..N : 2) {
            cmap_str.getOrThrow().remove("${i}")
        }
        let last1 = cmap_str.getOrThrow().last.getOrThrow()
        @Expect(last1, "98")
    }
}
