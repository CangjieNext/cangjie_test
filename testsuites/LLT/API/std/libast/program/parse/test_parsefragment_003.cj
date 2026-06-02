// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let tokens = quote(1,2,x,245 / 4, foo(1), {=>}, ((f |> g), 3))
    var e: Expr
    var p: Int64
    (e, p) = parseExprFragment(tokens, startFrom: 0)
    if (p != 1) {
        println("p = ${p}")
        return -1
    }
    if (tokens[p].kind != COMMA) {
        println("tokens[p].kind = ${tokens[p].kind}")
        return -1
    }
    if (e.toTokens().toString() != "1") {
        println("e.toTokens().toString() = ${e.toTokens().toString()}")
        return -1
    }
    p++
    (e, p) = parseExprFragment(tokens, startFrom: p)
    if (p != 3) {
        println("p = ${p}")
        return -1
    }
    if (tokens[p].kind != COMMA) {
        println("tokens[p].kind = ${tokens[p].kind}")
        return -1
    }
    if (e.toTokens().toString() != "2") {
        println("e.toTokens().toString() = ${e.toTokens().toString()}")
        return -1
    }
    p++
    (e, p) = parseExprFragment(tokens, startFrom: p)
    if (p != 5) {
        println("p = ${p}")
        return -1
    }
    if (tokens[p].kind != COMMA) {
        println("tokens[p].kind = ${tokens[p].kind}")
        return -1
    }
    if (e.toTokens().toString() != "x") {
        println("e.toTokens().toString() = ${e.toTokens().toString()}")
        return -1
    }
    p++
    (e, p) = parseExprFragment(tokens, startFrom: p)
    if (p != 9) {
        println("p = ${p}")
        return -1
    }
    if (tokens[p].kind != COMMA) {
        println("tokens[p].kind = ${tokens[p].kind}")
        return -1
    }
    if (e.toTokens().toString() != "245 / 4") {
        println("e.toTokens().toString() = ${e.toTokens().toString()}")
        return -1
    }

    p++
    (e, p) = parseExprFragment(tokens, startFrom: p)
    if (p != 14) {
        println("p = ${p}")
        return -1
    }
    if (tokens[p].kind != COMMA) {
        println("tokens[p].kind = ${tokens[p].kind}")
        return -1
    }
    if (e.toTokens().toString() != "foo(1)") {
        println("e.toTokens().toString() = ${e.toTokens().toString()}")
        return -1
    }

    p++
    (e, p) = parseExprFragment(tokens, startFrom: p)
    if (p != 18) {
        println("p = ${p}")
        return -1
    }
    if (tokens[p].kind != COMMA) {
        println("tokens[p].kind = ${tokens[p].kind}")
        return -1
    }
    if (e.toTokens().toString() != "{ => }") {
        println("e.toTokens().toString() = ${e.toTokens().toString()}")
        return -1
    }

    p++
    (e, p) = parseExprFragment(tokens, startFrom: p)
    if (p != 28) {
        println("p = ${p}")
        return -1
    }
    if (p != tokens.size) {
        println("p = ${p}")
        return -1
    }
    if (e.toTokens().toString() != "((f |> g), 3)") {
        println("e.toTokens().toString() = ${e.toTokens().toString()}")
        return -1
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
