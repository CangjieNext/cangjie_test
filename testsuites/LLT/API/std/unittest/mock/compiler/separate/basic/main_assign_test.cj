/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: main.cj

// EXEC: %compiler %cmp_opt -Woff=all %compile_lib_opt main.cj -o libmain.%middle --mock=on 2>&1
// EXEC: %compiler %cmp_opt -Woff=all --test-only %f libmain.%middle -o %output 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

package default

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

@Test
func toplevelVarAssign() {
    @On(vr = _).doesNothing()
    vr = 54
    @Assert(vr, 42)
}

@Test
func staticVarAssign() {
    @On(C.vr = _).doesNothing()
    C.vr = 54
    @Assert(C.vr, 42)
}
