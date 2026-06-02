/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f %pic_opt

macro package define

import std.ast.*

public macro M(input: Tokens) {
    return quote(1)
}

public macro M(input: Tokens) {
    return quote(0)
}
// (not iOS) ASSERT: scan sema_missing_entry
// ASSERT: scan sema_expand_macro_redefinition
// ASSERT: scan sema_overload_conflicts
