/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt  %use_ast %f -o %output

macro package define

import std.ast.*

public macro test(attr: Tokens, input: Tokens) {
    1
}
// (not iOS) ASSERT: scan sema_missing_entry
// ASSERT: scan sema_cannot_convert_literal
