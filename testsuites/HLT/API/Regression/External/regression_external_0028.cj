/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %overflow_wrapping %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

import std.unittest.*
import std.unittest.testmacro.*
import std.ast.*

@Test
func test(): Unit {
    let want = quote(1+2)
    @Assert(quote(1+2).toString(), want.toString())
}

main(): Unit {
}
