/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import stdx.unittest.data.*

@Test
class Test_csv_strategy_basic {
    @TestCase[record in csv("./files/simple_lf.csv")]
    func test(record: HashMap<String, String>): Unit {
        var expected = [
            HashMap<String, String>([("n", "1"), ("name", "Alex"), ("age", "21")]),
            HashMap<String, String>([("n", "2"), ("name", "John"), ("age", "28")])
        ]
        @Assert(expected.contains(record))
    }

    @TestCase[record in csv("./files/simple_lf.csv", header: [ "order", "firstname", "years old" ], skipRows: [ 0u64 ])]
    func testOverridenHeader(record: HashMap<String, String>): Unit {
        var expected = [
            HashMap<String, String>([("order", "1"), ("firstname", "Alex"), ("years old", "21")]),
            HashMap<String, String>([("order", "2"), ("firstname", "John"), ("years old", "28")])
        ]
        @Assert(expected.contains(record))
    }

    @TestCase[record in csv("./files/simple_lf.csv", skipColumns: [ 0u64, 2u64 ])]
    func testSkipColumns(record: HashMap<String, String>): Unit {
        var expected = [
            HashMap<String, String>([("name", "Alex")]),
            HashMap<String, String>([("name", "John")])
        ]
        @Assert(expected.contains(record))
    }
}
