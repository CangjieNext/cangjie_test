// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

func compareDeclResult(result: String, expect: String): Bool {
    var result_ = result.replace("\r", "")
    return result_ == expect
}

main(): Int64 {
    let tokens = quote(
        var x = 2
        func yy() {
            return 4
        }
        class Foo {}
        struct A {}
        extend A <: I {}
    )
    var e: Decl
    var p: Int64 = 0
    (e, p) = parseDeclFragment(tokens, startFrom: p)
    print(e.toTokens().toString())
    e.toTokens().dump()
    if (compareDeclResult(e.toTokens().toString(), "var x = 2\n") != true) {
        return 1
    }

    (e, p) = parseDeclFragment(tokens, startFrom: p)
    if (compareDeclResult(e.toTokens().toString(), "func yy() {\n    return 4\n}\n") != true) {
        println("e.toTokens().toString() = ${e.toTokens().toString()}")
        return 2
    }

    (e, p) = parseDeclFragment(tokens, startFrom: p)
    if (compareDeclResult(e.toTokens().toString(), "class Foo {\n}\n") != true) {
        println("e.toTokens().toString() = ${e.toTokens().toString()}")
        return 3
    }

    (e, p) = parseDeclFragment(tokens, startFrom: p)
    if (compareDeclResult(e.toTokens().toString(), "struct A {\n}\n") != true) {
        println("e.toTokens().toString() = ${e.toTokens().toString()}")
        return 4
    }

    (e, p) = parseDeclFragment(tokens, startFrom: p)
    if (compareDeclResult(e.toTokens().toString(), "extend A <: I {\n}\n") != true) {
        println("e.toTokens().toString() = ${e.toTokens().toString()}")
        return 5
    }

    if (p != tokens.size) {
        println("p = ${p}")
        return 6
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
