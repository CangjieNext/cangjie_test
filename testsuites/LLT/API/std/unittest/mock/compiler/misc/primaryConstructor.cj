/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

class C {
    public var a: Array<Int64> = Array<Int64>(10, { _ => 0 })

    public C() {
        a[0] = 10
    }
}

// ASSERT: scan-not error
