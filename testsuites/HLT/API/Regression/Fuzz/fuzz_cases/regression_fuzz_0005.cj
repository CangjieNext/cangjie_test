/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (!(target_ios | target_ios_simulator)) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f 

macro package A

import std.ast

public macro a1(x: Tokens, y: Tokens) {
    Tokens(0)
}

public macro a2(x: Tokens, y: Tokens) {
    quote(0)
}
// (!(target_ios | target_ios_simulator)) ASSERT: scan sema_missing_entry
