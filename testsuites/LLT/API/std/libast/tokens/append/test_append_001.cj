// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

main() {

    // Test for Tokens Operator Overloading.
    let tk1 = Token(TokenKind.IDENTIFIER, "foo")
    let tk2 = Token(TokenKind.IDENTIFIER, "bar")
    // Token + Token -> Tokens
    let tks1 = tk1 + tk2
    if (tks1.size != 2) {
        print("log 0")
        return -1
    }
    if (tks1[0] != tk1 || tks1[1] != tk2) {
        print("log 1")
        return 1
    }
    // Token + Tokens -> Tokens
    let tks2 = tk1 + tks1
    if (tks2.size != 3 || tks2.get(0) != tk1) {
        print("log 2")
        return 2
    }
    // Tokens + Token -> Tokens
    let tks3 = tks1 + tk2
    if (tks3.size != 3 || tks3[1] != tk2) {
        print("log 3")
        return 3
    }
    // Tokens + Tokens -> Tokens
    let tks4 = tks1 + tks2
    if (tks4.size != 5 || tks4[0] != tk1) {
        print("log 4")
        return 4
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
