/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./csv_skiplines_03.csv
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE: %run_stdx  %output %run_utest_opt %run_args | compare %f
// ASSERT: scan-begin case03:[(newname, name0), (newage, age0), (newgender, gender0)]
// ASSERT: scan-next case03:[(newname, name1), (newage, age1), (newgender, gender1)]
// ASSERT: scan-next case04:[(姓名, name0), (年龄, age0), (gender0, gender0)]
// ASSERT: scan-next case04:[(姓名, name1), (年龄, age1), (gender0, gender1)]
// ASSERT: scan-next case05:[(name0, name0), (age0, age0), (gender0, gender0)]
// ASSERT: scan-next case05:[(name0, name1), (age0, age1), (gender0, gender1)]

import std.collection.*
import stdx.unittest.data.*

@Test
public class Test_Csv_Reader_Header {
    @TestCase[person in csv("csv_skiplines_03.csv", delimiter: r';', header: [ "newname", "newage", "newgender" ])]
    func test03(person: HashMap<String, String>): Unit {
        println("case03:${person}")
    }

    @TestCase[person in csv("csv_skiplines_03.csv", delimiter: r';', header: [ "姓名", "年龄", "gender0" ])]
    func test04(person: HashMap<String, String>): Unit {
        println("case04:${person}")
    }

    @TestCase[person in csv("csv_skiplines_03.csv", delimiter: r';', header: [ "name0", "age0", "gender0" ])]
    func test05(person: HashMap<String, String>): Unit {
        println("case05:${person}")
    }
}
