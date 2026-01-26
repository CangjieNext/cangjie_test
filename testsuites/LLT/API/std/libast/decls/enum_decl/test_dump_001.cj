// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt
internal import std.ast.*

main(): Int64 {
    let input = quote(
        public enum TimeUnit<T1> <: I1 where T1 <: A {
            Year
            | Month(T1)
            func time() {}
        }
    )
    let decl = parseDecl(input)
    let enumDecl = match (decl as EnumDecl) {
        case Some(v) => v
        case None => throw Exception()
    }

    let output = quote($enumDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 1
    }
    enumDecl.identifier = Token(TokenKind.IDENTIFIER, "test")
    enumDecl.dump()
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
