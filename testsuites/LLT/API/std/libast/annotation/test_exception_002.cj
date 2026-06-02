// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main() {
    var cnt = 0
    try {
        var a = Annotation(quote(@!AA))
        a.at = Token(AT)
    } catch (e: ASTException) {
        cnt++
    }

    try {
        var a = Annotation(quote(@!AA))
        a.at = Token(AT_EXCL)
    } catch (e: ASTException) {
        cnt++
        println(e.message)
    }

    try {
        var a = Annotation(quote(@!AA))
        a.at = Token(SUB)
    } catch (e: ASTException) {
        cnt++
        println(e.message)
    }
    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
Illegal TokenKind, TokenKind should be AT or AT_EXCLAMATION
cnt = 1
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
