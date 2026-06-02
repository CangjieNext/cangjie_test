// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
import std.ast.*

main() {
    try {
        let tok1 = Token(TokenKind.NL, "\n")
        let tok2 = Token(TokenKind.NL, "\r\n")
    } catch (e: IllegalArgumentException) {
        return 1
    }
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
