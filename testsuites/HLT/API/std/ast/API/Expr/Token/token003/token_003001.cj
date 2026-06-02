/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    var tk1 = Token(TokenKind.DOT)
    var tk2 = Token(TokenKind.COMMA)
    var tk3 = Token(TokenKind.DOT)
    var res1 = tk1 == tk2
    var res2 = tk3 != tk2
    if (res1) {
        return 1
    }
    if (!res2) {
        return 2
    }
    return 0
}
