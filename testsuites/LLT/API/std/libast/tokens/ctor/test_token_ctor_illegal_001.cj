/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

// Token(TokenKind.DOLLAR_IDENTIFIER, v) must reject values that are not '$'
// followed by a lexically valid identifier. Guards the fix for issue 3487.
import std.ast.*

func checkReject(tag: String, k: TokenKind, v: String): Int64 {
    try {
        let _ = Token(k, v)
        println("[FAIL] ${tag} was accepted")
        return 1
    } catch (e: IllegalArgumentException) {
        println("[OK] ${tag} rejected")
        return 0
    } catch (e: Exception) {
        println("[FAIL] ${tag} unexpected exception")
        return 1
    }
}

main(): Int64 {
    var ret = 0
    ret = ret + checkReject("dollar-missing", TokenKind.DOLLAR_IDENTIFIER, "x")
    ret = ret + checkReject("dollar-digit", TokenKind.DOLLAR_IDENTIFIER, "$1")
    ret = ret + checkReject("dollar-empty", TokenKind.DOLLAR_IDENTIFIER, "$")
    ret = ret + checkReject("dollar-space", TokenKind.DOLLAR_IDENTIFIER, "$a b")
    if (ret != 0) {
        return 1
    }
    return 0
}

// ASSERT: regex \[OK\] dollar-missing rejected
// ASSERT: regex \[OK\] dollar-digit rejected
// ASSERT: regex \[OK\] dollar-empty rejected
// ASSERT: regex \[OK\] dollar-space rejected
