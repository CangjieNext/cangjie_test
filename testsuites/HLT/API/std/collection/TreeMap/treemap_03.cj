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
var cmap_str1 = Option<TreeMap<String, Int64>>.None
const N: Int64 = 500
var sum = 0

@Test
class Test_treemap_03 {
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
        //test the removeFirst()and removeLast() using Int64.
        PreData()
        let popfirst = cmap.getOrThrow().removeFirst().getOrThrow()
        let poplast = cmap.getOrThrow().removeLast().getOrThrow()
        @Expect(popfirst[0], 0)
        @Expect(popfirst[1], 1)
        @Expect(poplast[0], N-1)
        @Expect(poplast[1], N)
        let res = Array<Int64>(N - 2, repeat: 0)
        let resArr = Array<Int64>(N - 2, {i => i + 2})
        for ((k, v) in cmap.getOrThrow()) {
            res[k - 1] = v
        }
        @Expect(res,resArr)
        @Expect(res.size, resArr.size)
    }

    @TestCase
    func test_02(): Unit {
        //test the removeFirst() and poplastEntry() using String.
        PreData_str()
        let popfirst = cmap_str.getOrThrow().removeFirst().getOrThrow()
        let poplast = cmap_str.getOrThrow().removeLast().getOrThrow()
        @Expect(popfirst[0], "0")
        @Expect(popfirst[1], "1")
        @Expect(poplast[0], "99")
        @Expect(poplast[1], "100")
    }

    @TestCase
    func test_03(): Unit {
        //test the removeFirst() and removeLast() and then compare of String.
        let cmap = TreeMap<String, String>()
        for (i in 0..200) {
            cmap.add("${i}", "${i + 1}")
        }
        let first = cmap.removeFirst().getOrThrow()
        let last = cmap.removeLast().getOrThrow()
        //println(cmap_str.getOrThrow().toString())
        @Expect(first[0], "0")
        @Expect(first[1], "1")
        @Expect(last[0], "99")
        @Expect(last[1], "100")
        let file = File("./data/file_treemap03.txt", Read)
        var buffer = Array<Byte>(cmap.toString().size, repeat: 0)
        file.read(buffer)
        @Expect(cmap.toString(), String.fromUtf8(buffer))
    }

    @TestCase
    func test_04(): Unit {
        //test the removeFirst() and removeLast() with no element of Int.
        let cmap = TreeMap<Int64, Int64>()
        let popfirst = cmap.removeFirst()
        let poplast = cmap.removeLast()
        match (popfirst) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 1)
        match (poplast) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_05(): Unit {
        //test the removeFirst() and removeLast() with one element of Int.
        let cmap = TreeMap<Int64, Int64>([(1, 2)])
        let popfirst = cmap.removeFirst().getOrThrow()
        @Expect(popfirst[0], 1)
        @Expect(popfirst[1], 2)
        let poplast = cmap.removeLast()
        match (poplast) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_06(): Unit {
        //test the removeFirst() and removeLast() with one element of Int.
        let cmap = TreeMap<Int64, Int64>([(1, 2)])
        let poplast = cmap.removeLast().getOrThrow()
        @Expect(poplast[0], 1)
        @Expect(poplast[1], 2)
        let popfirst = cmap.removeFirst()
        match (popfirst) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_07(): Unit {
        //test the removeFirst() and removeLast() with two element of String.
        let cmap = TreeMap<String, String>([("1", "2"), ("2", "3")])
        let popfirst = cmap.removeFirst().getOrThrow()
        let poplast = cmap.removeLast().getOrThrow()
        @Expect(popfirst[0], "1")
        @Expect(popfirst[1], "2")
        @Expect(poplast[0], "2")
        @Expect(poplast[1], "3")
        let popfirst1 = cmap.removeFirst()
        let poplast1 = cmap.removeLast()
        match (popfirst1) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 1)
        match (poplast1) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_08(): Unit {
        //test the removeFirst() and removeLast() with no element of String and Int.
        let cmap = TreeMap<String, String>()
        let cmap_1 = TreeMap<Int64, Int64>()
        let popfirst = cmap.removeFirst()
        let popfirst1 = cmap_1.removeFirst()
        let poplast = cmap.removeLast()
        let poplast1 = cmap_1.removeLast()
        match (popfirst) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 1)
        match (poplast) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 2)
        match (popfirst1) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 3)
        match (poplast1) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 4)
    }

    @TestCase
    func test_09(): Unit {
        //test the removeFirst()and removeLast() and delete again using Int64.
        PreData()
        let popfirst = cmap.getOrThrow().removeFirst().getOrThrow()
        let poplast = cmap.getOrThrow().removeLast().getOrThrow()
        @Expect(popfirst[0], 0)
        @Expect(popfirst[1], 1)
        @Expect(poplast[0], N-1)
        @Expect(poplast[1], N)
        let popfirst1 = cmap.getOrThrow().removeFirst().getOrThrow()
        let poplast1 = cmap.getOrThrow().removeLast().getOrThrow()
        let res = Array<Int64>(N - 4, repeat: 0)
        let resArr = Array<Int64>(N - 4, {i => i + 3})
        for ((k, v) in cmap.getOrThrow()) {
            res[k - 2] = v
        }
        @Expect(res,resArr)
        @Expect(res.size, resArr.size)
    }

    @TestCase
    func test_10(): Unit {
        //test the removeFirst() and poplastEntry() and delete again using String.
        PreData_str()
        let popfirst = cmap_str.getOrThrow().removeFirst().getOrThrow()
        let poplast = cmap_str.getOrThrow().removeLast().getOrThrow()
        @Expect(popfirst[0], "0")
        @Expect(popfirst[1], "1")
        @Expect(poplast[0], "99")
        @Expect(poplast[1], "100")
        let popfirst1 = cmap_str.getOrThrow().removeFirst().getOrThrow()
        let poplast1 = cmap_str.getOrThrow().removeLast().getOrThrow()
        @Expect(popfirst1[0], "1")
        @Expect(popfirst1[1], "2")
        @Expect(poplast1[0], "98")
        @Expect(poplast1[1], "99")
    }
}
