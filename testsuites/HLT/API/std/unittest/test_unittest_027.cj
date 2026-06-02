/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan CASE: caseA01
// ASSERT: scan CASE: caseA02
// ASSERT: regex .*FAILED.*: 0

import std.unittest.*
import std.unittest.testmacro.*

func getNum(): Int32 {
    return -10
}

@Test
class TestA {
    @TestCase
    public func caseA01(): Unit {
        var expect: Int32 = -10
        expectEqual("expect", "getNum()", expect, getNum())
    }

    @TestCase
    public func caseA02(): Unit {
        var expect: Int16 = 10
        var actual: Int16 = 10
        expectEqual("actual", "actual", expect, actual)
    }
}
