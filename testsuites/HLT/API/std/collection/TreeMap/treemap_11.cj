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
var cmap_str = Option<TreeMap<String, String>>.None
var cmap_str1 = Option<TreeMap<String, Int64>>.None
const N: Int64 = 500
var sum = 0

@Test
class Test_treemap_11 {
    public func PreData_str(): Unit {
        let cmap1 = TreeMap<String, String>()
        for (i in -N..N) {
            cmap1.add("${i}", "${i + 1}")
        }
        cmap_str = Option<TreeMap<String, String>>.Some(cmap1)
    }

    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_01(): Unit {
        //test the exception key() and value() situation using String.
        PreData_str()
        var findupper1 = cmap_str.getOrThrow().forward("-1", inclusive: false).next().getOrThrow()
        @Expect(findupper1[0], "-10")
        @Expect(findupper1[1], "-9")
    }

    @TestCase
    func test_02(): Unit {
        //test the exception next() and prev() situation using Int64.
        PreData_str()
        let findlower1 = cmap_str.getOrThrow().backward("499", inclusive: false).next().getOrThrow()
        @Expect(findlower1[0], "498")
        @Expect(findlower1[1], "499")
    }
}
