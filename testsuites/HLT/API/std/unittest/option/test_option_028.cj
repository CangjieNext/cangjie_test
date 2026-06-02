/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan FAIL
// ASSERT: scan FAIL

import std.unittest.*
import std.unittest.testmacro.*

func getRes(): Bool {
    return false
}

@Test
class TestA {
    @TestCase
    public func caseA01(): Unit {
        var expect: Bool = true
        expectEqual("expect", "getRes()", expect, getRes())
    }

    @TestCase
    public func caseA02(): Unit {
        var expect: Bool = true
        var actual: Bool = false
        expectEqual("actual", "actual", expect, actual)
    }
}
