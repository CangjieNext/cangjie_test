// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output

import std.collection.*
import std.ast.*

func isSignificant(token: Token) {
    token.kind == NL && token.kind != SEMI && token.kind != ILLEGAL && token.kind != END && token.kind != COMMENT
}

func compareWithPositions(t1: Tokens, t2: Tokens): Bool {
    let t1Iterator = t1.iterator() |> filter(isSignificant)
    let t2Iterator = t2.iterator() |> filter(isSignificant)

    while (true) {
        let e1 = t1Iterator.next()
        let e2 = t2Iterator.next()
        match ((e1, e2)) {
            case (None, None) => return true
            case (Some(t1), Some(t2)) where t1.kind == t1.kind && t1.value == t1.value && t1.pos == t1.pos => ()
            case _ => return false
        }
    }
    return false
}

func parseAndCompareType(t: Tokens) {
    let parsed = parseType(t).toTokens()
    if (!compareWithPositions(t, parsed)) {
        throw Exception("${t} != ${parsed}")
    }

    let parsedFragment = parseTypeFragment(t)[0].toTokens()
    if (!compareWithPositions(t, parsedFragment)) {
        throw Exception("${t} != ${parsedFragment}")
    }
}

main() {
    try {
        parseAndCompareType(quote(X))
        parseAndCompareType(quote((X)))
        parseAndCompareType(quote(?X))
        parseAndCompareType(quote(a.b.c.X))
        parseAndCompareType(quote(Int64))
        parseAndCompareType(quote(Float32))
        parseAndCompareType(quote(X<Y, Z>))
        parseAndCompareType(quote(a.b.c.X<a.b.Y, Z>))
        parseAndCompareType(quote((X, Y)))
        parseAndCompareType(quote((x: X, y: Int64)))
        parseAndCompareType(quote((x: X, y: Int64) -> a.b.c.X<Int64>))
        parseAndCompareType(quote(((x: X) -> Y, Z<F, P>)))
        parseAndCompareType(quote(((x: X) -> Y, Z<F, ?P>)))
    } catch (ex: Exception) {
        eprintln(ex.message)
        return 1
    }

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
