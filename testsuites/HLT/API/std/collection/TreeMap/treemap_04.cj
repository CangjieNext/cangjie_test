/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./data
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*
import std.fs.*

var cmap = Option<TreeMap<Int64, Int64>>.None
var cmap_str = Option<TreeMap<String, String>>.None
var cmap_str1 = Option<TreeMap<String, Int64>>.None
const N: Int64 = 500
var sum = 0

@Test
class Test_treemap_04 {
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
        //test the clone() using Int64 .
        PreData()
        let cmap_clone = cmap.getOrThrow().clone()
        let first = cmap_clone.first.getOrThrow()
        let last = cmap_clone.last.getOrThrow()
        @Expect(first[0], 0)
        @Expect(first[1], 1)
        @Expect(last[0], N-1)
        @Expect(last[1], N)
        let popfirst = cmap_clone.removeFirst().getOrThrow()
        let poplast = cmap_clone.removeLast().getOrThrow()
        @Expect(popfirst[0], 0)
        @Expect(popfirst[1], 1)
        @Expect(poplast[0], N-1)
        @Expect(poplast[1], N)
        let res1 = Array<Int64>(N - 2, repeat: 0)
        let resArr1 = Array<Int64>(N - 2, {i => i + 2})
        for ((k, v) in cmap_clone) {
            res1[k - 1] = v
        }
        @Expect(res1,resArr1)
        @Expect(res1.size, resArr1.size)
        let cmap_clear = cmap_clone.clear()
        @Expect(cmap_clear.toString(), "()")
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
        //test the clone using String.
        PreData_str()
        let cmap_clone = cmap_str.getOrThrow().clone()
        let first = cmap_clone.first.getOrThrow()
        let last = cmap_clone.last.getOrThrow()
        @Expect(first[0], "0")
        @Expect(first[1], "1")
        @Expect(last[0], "99")
        @Expect(last[1], "100")
        let popfirst = cmap_clone.removeFirst().getOrThrow()
        let poplast = cmap_clone.removeLast().getOrThrow()
        @Expect(popfirst[0], "0")
        @Expect(popfirst[1], "1")
        @Expect(poplast[0], "99")
        @Expect(poplast[1], "100")
        let first1 = cmap_clone.first.getOrThrow()
        let last1 = cmap_clone.last.getOrThrow()
        @Expect(first1[0], "1")
        @Expect(first1[1], "2")
        @Expect(last1[0], "98")
        @Expect(last1[1], "99")
        let first2 = cmap_str.getOrThrow().first.getOrThrow()
        let last2 = cmap_str.getOrThrow().last.getOrThrow()
        @Expect(first2[0], "0")
        @Expect(first2[1], "1")
        @Expect(last2[0], "99")
        @Expect(last2[1], "100")
    }

    @TestCase
    func test_03(): Unit {
        //test the clone() and then compare.
        let cmap = TreeMap<String, String>()
        for (i in 0..200) {
            cmap.add("${i}", "${i + 1}")
        }
        let cmap_clone = cmap.clone()
        let file = File("./data/file_treemap04.txt", Read)
        var buffer = Array<Byte>(cmap.toString().size, repeat: 0)
        file.read(buffer)
        @Expect(cmap_clone.toString(), String.fromUtf8(buffer))
        let cmap_clear = cmap_clone.clear()
        @Expect(cmap_clear.toString(), "()")
        let first = cmap_clone.first
        let last = cmap_clone.last
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
        let popfirst = cmap_clone.removeFirst()
        let poplast = cmap_clone.removeLast()
        match (popfirst) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 3)
        match (poplast) {
            case None => sum += 1
            case _ => ()
        }
        @Expect(sum, 4)
        @Expect(cmap.toString(), String.fromUtf8(buffer))
        @Expect(cmap_clone.contains("1"), false)
        @Expect(cmap.contains("1"), true)
        @Expect(cmap_clone.get("1"), None)
        @Expect(cmap.get("1"), "2")
    }
}
