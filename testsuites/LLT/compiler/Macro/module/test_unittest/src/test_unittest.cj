// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../test_unittest
// EXEC: %compiler %pkg_opt test_unittest/src/p1 -o libp1.%middle %compile_lib_opt
// EXEC: %compiler %pkg_opt test_unittest/src libp1.%middle -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class TestC {
    @TestCase
    public func caseC(): Unit {
        var buf: ArrayList<String> = ArrayList<String>(3, {x: Int64 => x.toString()})
        var res = buf.isEmpty().toString()
        expectEqual("res", "3", res, "false")
    }
}
