/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: main.cj
// EXEC-PIPE-1: %compiler %cmp_macro %f 2>&1 | compare %f

macro package define

import std.ast.*

foreign var a: Int64 = 1
foreign let b: Int64 = 1

foreign func test(): Unit

public macro M(attr: Tokens, input: Tokens): Tokens {
    return quote(0)
}
// ASSERT: scan sema_native_var_error
