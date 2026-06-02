// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.collection.*

main(): Int64 {
    let input = quote(
        public enum TimeUnit<T1, T2> <: I1 where T1 <: A, T2 <: B {
            Year
            | Month(T1)
            | Day(T2)
            | Hour
            func time() {}
        }
    )
    let enumDecl = EnumDecl(input)
    let output1 = enumDecl.toTokens()
    let flag1 = compareTokens(input, output1)
    if (!flag1) {
        return 1
    }
    let constructor1 = Constructor()
    let constructor2 = Constructor()
    constructor1.identifier = Token(IDENTIFIER, "test1")
    constructor2.identifier = Token(IDENTIFIER, "test2")
    enumDecl.constructors = ArrayList<Constructor>([constructor1, constructor2])
    let flag2 = compareTokens(enumDecl.toTokens(),
        quote(
        public enum TimeUnit<T1, T2> <: I1 where T1 <: A, T2 <: B {
            | test1
            | test2
            func time() {}
        }
    ))
    if (!flag2) {
        return 2
    }
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
