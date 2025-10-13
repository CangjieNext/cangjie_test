/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
package lib

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

public class GC<T> {
    public static func GC_FOO(): Unit {}
}

public class C {
    public static func C_FOO_NON_GENERIC(): Unit {}
    public static func C_FOO_GENERIC<T>(): Unit {}
}

@Test
func testNonGeneric(): Unit {
    @On(C.C_FOO_NON_GENERIC()).returns(())
    @Expect(C.C_FOO_NON_GENERIC(), ())
}

@Test
func testGeneric(): Unit {
    @On(C.C_FOO_GENERIC<String>()).returns(())
    @Expect(C.C_FOO_GENERIC<String>(), ())
}

// ASSERT: scan-not error
