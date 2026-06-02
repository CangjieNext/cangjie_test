/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

var cmap = Option<TreeSet<Int64>>.None
var cmap_str = Option<TreeSet<String>>.None
const N: Int64 = 50
var sum = 0

@Test
class Test_treeset_dorward_backward_08 {
    public func PreData(): Unit {
        let cmap1 = TreeSet<Int64>()
        for (i in -N..N) {
            cmap1.add(i)
        }
        cmap = Option<TreeSet<Int64>>.Some(cmap1)
    }

    public func PreData_str(): Unit {
        let cmap1 = TreeSet<String>()
        for (i in -N..N) {
            cmap1.add("${i}")
        }
        cmap_str = Option<TreeSet<String>>.Some(cmap1)
    }

    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_01(): Unit {
        PreData()
        cmap.getOrThrow().retain(all: HashSet<Int64>([1, 2, 3]))
        @Expect(cmap.getOrThrow().size, 3)
        cmap.getOrThrow().retain(all: HashSet<Int64>())
        @Expect(cmap.getOrThrow().size, 0)
    }

    @TestCase
    func test_02(): Unit {
        PreData()
        @Expect(cmap.getOrThrow().subsetOf(HashSet<Int64>([1,2,3])), false)
        @Expect(cmap.getOrThrow().subsetOf(HashSet<Int64>()), false)
        @Expect(cmap.getOrThrow().subsetOf(HashSet<Int64>([100])), false)
        @Expect(cmap.getOrThrow().subsetOf(HashSet<Int64>(200,{x:Int64=> x -51})), true)
    }

    @TestCase
    func test_03(): Unit {
        PreData_str()
        cmap_str.getOrThrow().retain(all: HashSet<String>(["1", "2", "3"]))
        @Expect(cmap_str.getOrThrow().size, 3)
        cmap_str.getOrThrow().retain(all: HashSet<String>())
        @Expect(cmap_str.getOrThrow().size, 0)
    }

    @TestCase
    func test_04(): Unit {
        PreData_str()
        @Expect(cmap_str.getOrThrow().subsetOf(HashSet<String>(["1","2","3"])), false)
        @Expect(cmap_str.getOrThrow().subsetOf(HashSet<String>()), false)
        @Expect(cmap_str.getOrThrow().subsetOf(HashSet<String>(["100"])), false)
        @Expect(cmap_str.getOrThrow().subsetOf(HashSet<String>(200,{x:Int64=> (x - 51).toString()})), true)
    }
}
