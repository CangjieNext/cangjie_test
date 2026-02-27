/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test_70004.cj
// EXEC: %compiler %cmp_macro %f
// (not iOS) EXEC-PIPE-1: %run_macro %compiler %cmp_opt  test_70004.cj -o %output | compare %f
// (iOS) EXEC-PIPE: %run_macro %compiler %cmp_opt  test_70004.cj -o %output
// ASSERT: scan pass

macro package define

import std.ast.*

public macro M(input: Tokens) {
    var it = input.iterator()
    it.next()
    if (it.seeing(TokenKind.INTEGER_LITERAL)) {
        print("pass")
    } else {
        print("fail")
    }
    return input
}
// ASSERT: regex-not no position error occurred
