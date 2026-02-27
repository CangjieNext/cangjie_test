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

var cmap = Option<TreeMap<Int64, Int64>>.None
var cmap_1 = Option<TreeMap<Int64, Int64>>.None
var cmap_2 = Option<TreeMap<Int64, Int64>>.None
var cmap_str = Option<TreeMap<String, String>>.None
var cmap_str_1 = Option<TreeMap<String, String>>.None
var cmap_str_2 = Option<TreeMap<String, String>>.None
const N: Int64 = 500
var sum = 0

@Test
class Test_treemap_06 {
    public func PreData(): Unit {
        let cmap1 = TreeMap<Int64, Int64>()
        for (i in -N..N) {
            cmap1.add(i, i + 1)
        }
        cmap = Option<TreeMap<Int64, Int64>>.Some(cmap1)
    }

    public func PreData1(): Unit {
        let cmap1 = TreeMap<Int64, Int64>()
        for (i in 0..N) {
            cmap1.add(i, i + 1)
        }
        cmap_1 = Option<TreeMap<Int64, Int64>>.Some(cmap1)
    }

    public func PreData2(): Unit {
        let cmap1 = TreeMap<Int64, Int64>()
        for (i in -N..N) {
            cmap1.add(i, i + 1)
        }
        cmap_2 = Option<TreeMap<Int64, Int64>>.Some(cmap1)
    }

    public func PreData_str(): Unit {
        let cmap1 = TreeMap<String, String>()
        for (i in -N..N) {
            cmap1.add("${i}", "${i + 1}")
        }
        cmap_str = Option<TreeMap<String, String>>.Some(cmap1)
    }
    public func PreData_str1(): Unit {
        let cmap1 = TreeMap<String, String>()
        for (i in 0..N) {
            cmap1.add("${i}", "${i + 1}")
        }
        cmap_str_1 = Option<TreeMap<String, String>>.Some(cmap1)
    }
    public func PreData_str2(): Unit {
        let cmap1 = TreeMap<String, String>()
        for (i in -N..N) {
            cmap1.add("${i}", "${i + 1}")
        }
        cmap_str_2 = Option<TreeMap<String, String>>.Some(cmap1)
    }

    @TestCase
    func test_01(): Unit {
        //test the Comparable using Int64 .
        PreData()
        PreData1()
        PreData2()
        @Expect(cmap.getOrThrow() == cmap.getOrThrow(), true)
        @Expect(cmap.getOrThrow() == cmap_1.getOrThrow(), false)
        @Expect(cmap.getOrThrow() != cmap_1.getOrThrow(), true)
        @Expect(cmap.getOrThrow() != cmap_2.getOrThrow(), false)
    }

    @TestCase
    func test_02(): Unit {
        //test the Comparable using String .
        PreData_str()
        PreData_str1()
        PreData_str2()
        @Expect(cmap_str.getOrThrow() == cmap_str.getOrThrow(), true)
        @Expect(cmap_str.getOrThrow() == cmap_str_1.getOrThrow(), false)
        @Expect(cmap_str.getOrThrow() != cmap_str_1.getOrThrow(), true)
        @Expect(cmap_str.getOrThrow() != cmap_str_2.getOrThrow(), false)
    }
}
