/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: main.cj test20047.cj
//  EXEC: %compiler  test20047.cj %cmp_macro %enable_macro 
//  EXEC: %compiler  %f  %cmp_macro %enable_macro 
//  ERRCHECK: %compiler %cmp_opt main.cj %use_ast -o %output

macro package define

import std.ast.*
import test20047.*

public macro M(attr: Tokens, input: Tokens): Tokens {
    return @test(0)
}
// ASSERT: scan sema_undeclared_identifier
