/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./tsv_skiplines_02.tsv
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE-1: %run_stdx %output %run_utest_opt %run_args --no-color  2>&1 | compare %f
// ASSERT: scan case01:[(age1, age3), (gender1, gender3)]
// ASSERT: scan case01:[(age1, age4), (gender1, gender4)]
// ASSERT: scan case02:[(age1, age4), (gender1, gender4)]
// ASSERT: scan [ ERROR  ] CASE: test03

import std.collection.*
import stdx.unittest.data.*

@Test
public class Test_Tsv_Reader_Skip_Lines {
    @TestCase[person in tsv("tsv_skiplines_02.tsv", commentChar: r'跳', skipRows: [ 0u64 ], skipColumns: [ 0u64 ], skipEmptyLines: true)]
    func test01(person: HashMap<String, String>): Unit {
        println("case01:${person}")
    }

    @TestCase[person in tsv("tsv_skiplines_02.tsv", commentChar: r'跳', skipRows: [ 0u64, 2u64 ], skipColumns: [ 0u64 ], skipEmptyLines: true)]
    func test02(person: HashMap<String, String>): Unit {
        println("case02:${person}")
    }

    @TestCase[person in tsv("tsv_skiplines_02.tsv", commentChar: r'n', skipRows: [ 0u64, 2u64 ], skipColumns: [ 0u64 ], skipEmptyLines: true)]
    func test03(person: HashMap<String, String>): Unit {
        println("case03:${person}")
    }
}
