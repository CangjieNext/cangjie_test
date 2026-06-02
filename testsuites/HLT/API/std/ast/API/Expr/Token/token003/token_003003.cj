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
import std.unicode.*

main() {
    var tk = Token(TokenKind.DOT)
    var tks: Tokens = quote(public var a: Int64 = 1)
    var res: Tokens = tk + tks
    if (res.toString().trim() != ".public var a: Int64 = 1") {
        return 1
    }
    return 0
}
