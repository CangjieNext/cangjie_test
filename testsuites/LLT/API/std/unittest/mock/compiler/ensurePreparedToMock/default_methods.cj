/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (LLVM) EXEC: %compiler %cmp_opt -Woff=all --test %f -o %output 2>&1
// (LLVM) EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

public interface I {
    static func STATIC_FUNC(): String { "original" }
}
class C1 <: I {}

extend C1 {
    public static func static_call() {
        return STATIC_FUNC()
    }
}

@Test
func test_instance_C1() {
    let a = mock<C1>()
    @On(a.FUNC()).returns("mocked")
}
