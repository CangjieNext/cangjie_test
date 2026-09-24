/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

// Lexically valid identifier values must still be accepted after the kind/value
// consistency check was tightened for issue 3487. The empty value stays accepted
// for the internal default placeholder of identifier tokens.
import std.ast.*

func checkAccept(tag: String, k: TokenKind, v: String): Int64 {
    try {
        let tk = Token(k, v)
        if (tk.value != v) {
            println("[FAIL] ${tag} value corrupted")
            return 1
        }
        println("[OK] ${tag} accepted")
        return 0
    } catch (e: Exception) {
        println("[FAIL] ${tag} unexpectedly rejected")
        return 1
    }
}

main(): Int64 {
    var ret = 0
    ret = ret + checkAccept("plain", TokenKind.IDENTIFIER, "abc")
    ret = ret + checkAccept("underscore-start", TokenKind.IDENTIFIER, "_foo")
    ret = ret + checkAccept("keyword-as-raw", TokenKind.IDENTIFIER, "`type`")
    ret = ret + checkAccept("unicode", TokenKind.IDENTIFIER, "中文标识符")
    ret = ret + checkAccept("empty", TokenKind.IDENTIFIER, "")
    ret = ret + checkAccept("dollar-plain", TokenKind.DOLLAR_IDENTIFIER, "$x")
    ret = ret + checkAccept("dollar-raw", TokenKind.DOLLAR_IDENTIFIER, "$`x`")
    if (ret != 0) {
        return 1
    }
    return 0
}

// ASSERT: regex \[OK\] plain accepted
// ASSERT: regex \[OK\] underscore-start accepted
// ASSERT: regex \[OK\] keyword-as-raw accepted
// ASSERT: regex \[OK\] unicode accepted
// ASSERT: regex \[OK\] empty accepted
// ASSERT: regex \[OK\] dollar-plain accepted
// ASSERT: regex \[OK\] dollar-raw accepted
