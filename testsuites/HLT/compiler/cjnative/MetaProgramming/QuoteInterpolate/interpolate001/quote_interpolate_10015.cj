/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: main.cj
// ERRCHECK: %compiler %cmp_opt %f %pic_opt

macro package define

import std.ast.*

public macro test(input: Tokens): Tokens {
    var x = quote($(()))
    x.dump()
    return quote(0)
}
// (not iOS) ASSERT: scan sema_missing_entry
// ASSERT: scan sema_undeclared_identifier
