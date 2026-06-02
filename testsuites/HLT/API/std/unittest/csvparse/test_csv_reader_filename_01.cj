/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./csv02.csv
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx  %output %run_utest_opt %run_args

import std.collection.*
import std.fs.*
import stdx.unittest.data.*

@Test
public class Test_Csv_Reader {
    var abs_path = canonicalize(Path("./csv02.csv")).toString()

    @TestCase[person in csv(abs_path)]
    func test01(person: HashMap<String, String>): Unit {
        println(person)
    }

    @TestCase[person in csv("./csv02.csv")]
    func test02(person: HashMap<String, String>): Unit {
        println(person)
    }
}
