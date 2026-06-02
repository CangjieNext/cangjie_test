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
class Test_treeset_clone_04 {
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
        //test the clone() using Int64 .
        PreData()
        let cmap_clone = cmap.getOrThrow().clone()
        let first = cmap_clone.first.getOrThrow()
        let last = cmap_clone.last.getOrThrow()
        @Expect(first, 0)
        @Expect(last, N-1)
        let popfirst = cmap_clone.removeFirst().getOrThrow()
        let poplast = cmap_clone.removeLast().getOrThrow()
        @Expect(popfirst, 0)
        @Expect(poplast, N-1)
        let resArr1 = Array<Int64>(N - 2, {i => i + 1})
        @Expect(cmap_clone.toArray(), resArr1)
        let cmap_clear = cmap_clone.clear()
        @Expect(cmap_clear.toString(), "()")
        let resArr = Array<Int64>(N, {i => i})
        @Expect(cmap.getOrThrow().toArray(), resArr)
    }

    @TestCase
    func test_02(): Unit {
        //test the clone using String.
        PreData_str()
        let cmap_clone = cmap_str.getOrThrow().clone()
        let first = cmap_clone.first.getOrThrow()
        let last = cmap_clone.last.getOrThrow()
        @Expect(first, "0")
        @Expect(last, "99")
        let popfirst = cmap_clone.removeFirst().getOrThrow()
        let poplast = cmap_clone.removeLast().getOrThrow()
        @Expect(popfirst, "0")
        @Expect(poplast, "99")
        let first1 = cmap_clone.first.getOrThrow()
        let last1 = cmap_clone.last.getOrThrow()
        @Expect(first1, "1")
        @Expect(last1, "98")
        let first2 = cmap_str.getOrThrow().first.getOrThrow()
        let last2 = cmap_str.getOrThrow().last.getOrThrow()
        @Expect(first2, "0")
        @Expect(last2, "99")
    }

    @TestCase
    func test_03(): Unit {
        //test the clone() and then compare.
        let cmap = TreeSet<String>()
        for (i in 0..200) {
            cmap.add("${i}")
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
    }
}
