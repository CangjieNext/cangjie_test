/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

// Token(TokenKind.IDENTIFIER, v) must reject values that are not lexically valid
// identifiers. Guards the fix for issue 3487: Token(TokenKind.IDENTIFIER, "1")
// used to be accepted silently and later produced an invalid PropDecl named "1".
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
    ret = ret + checkReject("digit-start", TokenKind.IDENTIFIER, "1")
    ret = ret + checkReject("digit-start-alpha", TokenKind.IDENTIFIER, "1abc")
    ret = ret + checkReject("dash", TokenKind.IDENTIFIER, "a-b")
    ret = ret + checkReject("space", TokenKind.IDENTIFIER, "a b")
    ret = ret + checkReject("dot", TokenKind.IDENTIFIER, "a.b")
    ret = ret + checkReject("stray-backquote", TokenKind.IDENTIFIER, "a`b")
    if (ret != 0) {
        return 1
    }
    return 0
}

// ASSERT: regex \[OK\] digit-start rejected
// ASSERT: regex \[OK\] digit-start-alpha rejected
// ASSERT: regex \[OK\] dash rejected
// ASSERT: regex \[OK\] space rejected
// ASSERT: regex \[OK\] dot rejected
// ASSERT: regex \[OK\] stray-backquote rejected
