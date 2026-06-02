/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: m1
// EXEC: %compiler %cmp_opt --module-name m1 %f %cmp_utest_opt -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: regex (.*PASS.*) CASE: caseA

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
public class TestA {
    @TestCase
    public func caseA(): Unit {
        var buf: ArrayList<String> = ArrayList<String>(3, {x: Int64 => x.toString()})
        var res = buf.size
        @Expect(res, 3)
    }
}
