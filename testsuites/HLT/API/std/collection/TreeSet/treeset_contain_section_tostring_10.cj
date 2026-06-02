/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f --test
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

var cmap = Option<TreeSet<Int64>>.None
var cmap_str = Option<TreeSet<String>>.None
const N: Int64 = 10
var sum = 0

@Test
class Test_treeset_contain_section_tostring_10 {
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
        @Expect(cmap.getOrThrow().contains(1), true)
        @Expect(cmap.getOrThrow().contains(all:HashSet<Int64>([1,2,3]) ), true)
        @Expect(cmap.getOrThrow().contains(1000), false)
        @Expect(cmap.getOrThrow().contains(all:HashSet<Int64>([1,2,100]) ), false)
    }

    @TestCase
    func test_02(): Unit {
        PreData()
        let res = cmap.getOrThrow() & HashSet<Int64>([1, 2, 100])
        @Expect(res , TreeSet<Int64>([1, 2]))
    }

    @TestCase
    func test_03(): Unit {
        let set1: TreeSet<Int64> = TreeSet<Int64>([123, 789, 456])
        let set2: TreeSet<Int64> = TreeSet<Int64>([123, 434, 123])
        var res = set1 | set2
        @Expect(res , TreeSet<Int64>([123,789,456,434]))
    }

    @TestCase
    func test_04(): Unit {
        let set1: TreeSet<Int64> = TreeSet<Int64>([-8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
        var res = cmap.getOrThrow() - set1
        @Expect(res , TreeSet<Int64>([-10,-9]))
    }

    @TestCase
    func test_05(): Unit {
        PreData_str()
        @Expect(cmap_str.getOrThrow().contains("1"), true)
        @Expect(cmap_str.getOrThrow().contains(all:HashSet<String>(["1","2","3"]) ), true)
        @Expect(cmap_str.getOrThrow().contains("1000"), false)
        @Expect(cmap_str.getOrThrow().contains(all:HashSet<String>(["1","2","100"]) ), false)
    }
}
