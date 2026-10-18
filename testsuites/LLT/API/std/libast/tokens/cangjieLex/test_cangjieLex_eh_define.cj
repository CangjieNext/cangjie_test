/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package eh_lex_define

import std.ast.*

// Lex effect-handler code with cangjieLex during macro expansion and parse it.
// With the host compilation configured with --enable-eh, the EH keywords must
// not be demoted to identifiers, and parseExpr/parseDecl/parseProgram must
// accept them. Regression for UsersForum issue 3489.
public macro M(input: Tokens): Tokens {
    let ehExpr = """
try {
    perform Eff()
} handle (_: Eff) {
    resume with 0
}"""
    let lexed = cangjieLex(ehExpr)
    var demoted: Bool = false
    for (t in lexed) {
        if (t.value == "handle" && t.kind != TokenKind.HANDLE) {
            demoted = true
        }
        if (t.value == "perform" && t.kind != TokenKind.PERFORM) {
            demoted = true
        }
        if (t.value == "resume" && t.kind != TokenKind.RESUME) {
            demoted = true
        }
    }
    if (demoted) {
        diagReport(ERROR, input, "cangjieLex demoted the effect-handler keywords to IDENTIFIER",
            "expected HANDLE/PERFORM/RESUME when the host compilation enables effect handlers")
        return input
    }
    let te = (parseExpr(lexed) as TryExpr).getOrThrow()
    if (!compareTokens(lexed, te.toTokens())) {
        diagReport(ERROR, input, "parseExpr result does not round-trip the EH tokens",
            "compareTokens between the lexed tokens and te.toTokens() failed")
    }
    let ehDecl = """
func f() {
    try {
        perform Eff()
    } handle (_: Eff) {
        resume with 0
    }
}"""
    parseDecl(cangjieLex(ehDecl))
    let ehProg = """
package demo

func f() {
    try {
        perform Eff()
    } handle (_: Eff) {
        resume with 0
    }
}"""
    parseProgram(cangjieLex(ehProg))
    return input
}
