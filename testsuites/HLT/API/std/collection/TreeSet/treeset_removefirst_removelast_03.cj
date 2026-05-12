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
class Test_treeset_emovefirst_removelast_03 {
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
        //test the removeFirst()and removeLast() using Int64.
        PreData()
        let popfirst = cmap.getOrThrow().removeFirst().getOrThrow()
        let poplast = cmap.getOrThrow().removeLast().getOrThrow()
        @Expect(popfirst, 0)
        @Expect(poplast, N-1)
        let resArr = Array<Int64>(N - 2, {i => i + 1})
        @Expect(cmap.getOrThrow().toArray(), resArr)
    }

    @TestCase
    func test_02(): Unit {
        //test the removeFirst() and poplastEntry() using String.
        PreData_str()
        let popfirst = cmap_str.getOrThrow().removeFirst().getOrThrow()
        let poplast = cmap_str.getOrThrow().removeLast().getOrThrow()
        @Expect(popfirst, "0")
        @Expect(poplast, "99")
    }

    @TestCase
    func test_03(): Unit {
        //test the removeFirst() and removeLast() and then compare of String.
        let cmap = TreeSet<String>()
        for (i in 0..200) {
            cmap.add("${i}")
        }
        let first = cmap.removeFirst().getOrThrow()
        let last = cmap.removeLast().getOrThrow()
        @Expect(first, "0")
        @Expect(last, "99")
        let file = File("./data/file_treemap03.txt", Read)
        var buffer = Array<Byte>(cmap.toString().size, repeat: 0)
        file.read(buffer)
        @Expect(cmap.toString(), String.fromUtf8(buffer))
    }

    @TestCase
    func test_04(): Unit {
        //test the removeFirst() and removeLast() with no element of Int.
        let cmap = TreeSet<Int64>()
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
        let cmap = TreeSet<Int64>([1])
        let popfirst = cmap.removeFirst().getOrThrow()
        @Expect(popfirst, 1)
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
        let cmap = TreeSet<Int64>([1])
        let poplast = cmap.removeLast().getOrThrow()
        @Expect(poplast, 1)
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
        let cmap = TreeSet<String>(["1", "2"])
        let popfirst = cmap.removeFirst().getOrThrow()
        let poplast = cmap.removeLast().getOrThrow()
        @Expect(popfirst, "1")
        @Expect(poplast, "2")
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
        let cmap = TreeSet<String>()
        let cmap_1 = TreeSet<Int64>()
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
        @Expect(popfirst, 0)
        @Expect(poplast, N-1)
        let popfirst1 = cmap.getOrThrow().removeFirst().getOrThrow()
        let poplast1 = cmap.getOrThrow().removeLast().getOrThrow()
        let resArr = Array<Int64>(N - 4, {i => i + 2})
        @Expect(cmap.getOrThrow().toArray(), resArr)
    }

    @TestCase
    func test_10(): Unit {
        //test the removeFirst() and poplastEntry() and delete again using String.
        PreData_str()
        let popfirst = cmap_str.getOrThrow().removeFirst().getOrThrow()
        let poplast = cmap_str.getOrThrow().removeLast().getOrThrow()
        @Expect(popfirst, "0")
        @Expect(poplast, "99")
        let popfirst1 = cmap_str.getOrThrow().removeFirst().getOrThrow()
        let poplast1 = cmap_str.getOrThrow().removeLast().getOrThrow()
        @Expect(popfirst1, "1")
        @Expect(poplast1, "98")
    }
}
