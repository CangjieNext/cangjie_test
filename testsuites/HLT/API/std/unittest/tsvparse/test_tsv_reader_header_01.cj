/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./tsv_skiplines_02.tsv
// DEPENDENCE: ./tsv_skiplines_03.tsv
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args | compare %f
// ASSERT: scan-begin case01:[(newage, age1), (newgender, gender1)]
// ASSERT: scan-next case01:[(newage, age3), (newgender, gender3)]
// ASSERT: scan-next case01:[(newage, age4), (newgender, gender4)]
// ASSERT: scan-next case02:[(newage, age0), (newgender, gender0)]
// ASSERT: scan-next case02:[(newage, age1), (newgender, gender1)]
// ASSERT: scan-next case02:[(newage, age3), (newgender, gender3)]
// ASSERT: scan-next case03:[(newname, name0), (newage, age0), (newgender, gender0)]
// ASSERT: scan-next case03:[(newname, name1), (newage, age1), (newgender, gender1)]
// ASSERT: scan-next case04:[(姓名, name0), (年龄, age0), (gender0, gender0)]
// ASSERT: scan-next case04:[(姓名, name1), (年龄, age1), (gender0, gender1)]
// ASSERT: scan-next case05:[(name0, name0), (age0, age0), (gender0, gender0)]
// ASSERT: scan-next case05:[(name0, name1), (age0, age1), (gender0, gender1)]

import std.collection.*
import stdx.unittest.data.*

@Test
public class Test_Tsv_Reader_Header {
    @TestCase[person in tsv("tsv_skiplines_02.tsv", commentChar: r'跳', header: [ "newage", "newgender" ], 
 skipRows: [ 0u64 ], skipColumns: [ 0u64 ], skipEmptyLines: true)]
    func test01(person: HashMap<String, String>): Unit {
        println("case01:${person}")
    }

    @TestCase[person in tsv("tsv_skiplines_02.tsv", commentChar: r'跳', header: [ "newage", "newgender" ], 
 skipRows: [ 3u64 ], skipColumns: [ 0u64 ], skipEmptyLines: true)]
    func test02(person: HashMap<String, String>): Unit {
        println("case02:${person}")
    }

    @TestCase[person in tsv("tsv_skiplines_03.tsv", header: [ "newname", "newage", "newgender" ])]
    func test03(person: HashMap<String, String>): Unit {
        println("case03:${person}")
    }

    @TestCase[person in tsv("tsv_skiplines_03.tsv", header: [ "姓名", "年龄", "gender0" ])]
    func test04(person: HashMap<String, String>): Unit {
        println("case04:${person}")
    }

    @TestCase[person in tsv("tsv_skiplines_03.tsv", header: [ "name0", "age0", "gender0" ])]
    func test05(person: HashMap<String, String>): Unit {
        println("case05:${person}")
    }
}
