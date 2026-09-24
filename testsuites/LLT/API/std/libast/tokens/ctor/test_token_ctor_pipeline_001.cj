/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

// Guards that the kind/value consistency check for issue 3487 does not break the
// downstream pipelines: quote interpolation into parseDecl, and the parse ->
// toTokens roundtrip of a dotted macro call name (carried by IDENTIFIER tokens).
import std.ast.*

main(): Int64 {
    // The original repro pipeline of issue 3487 with a legal identifier.
    try {
        let tk1 = Token(TokenKind.IDENTIFIER, "abc")
        let tk2 = quote(prop $(tk1): Int64 { get() { 0 }})
        let decl = parseDecl(tk2, astKind: "PropDecl")
        let s = "${decl.toTokens()}"
        if (!s.contains("prop abc")) {
            println("[FAIL] unexpected prop tokens: ${s}")
            return 1
        }
        println("[OK] quote+parseDecl pipeline")
    } catch (e: Exception) {
        println("[FAIL] quote+parseDecl pipeline: ${e.message}")
        return 1
    }
    // Dotted macro call names (p1.p2.M) are carried by IDENTIFIER tokens whose
    // value is not a lexical identifier; they must survive parse -> toTokens.
    try {
        let decl = parseDecl(quote(@a.b.M func f() {}))
        let s = "${decl.toTokens()}"
        if (!s.contains("@a.b.M") || !s.contains("func f")) {
            println("[FAIL] unexpected macro call tokens: ${s}")
            return 1
        }
        println("[OK] dotted macro name roundtrip")
    } catch (e: Exception) {
        println("[FAIL] dotted macro name roundtrip: ${e.message}")
        return 1
    }
    return 0
}

// ASSERT: regex \[OK\] quote\+parseDecl pipeline
// ASSERT: regex \[OK\] dotted macro name roundtrip
