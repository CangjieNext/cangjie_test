/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

func compareResult(inputs: Array<Tokens>): Bool {
    for (input in inputs) {
        var expr = parseDecl(input)
        var b = match (expr as TypeAliasDecl) {
            case Some(v) => v
            case None => throw Exception("Not TypeAliasDecl")
        }
        var output = b.toTokens()
        var flag = compareTokens(input, output)
        if (!flag) {
            print("input tokens:\n")
            input.dump()
            print("output tokens:\n")
            output.dump()
            return false
        }
    }
    return true
}

main() {
    var inputs: Array<Tokens> = [
        quote(public type A<T, V> = B<Int64>),
        quote(type A<T, V> = ((((M7_<I1_>)->G1_))->(G2_, G3_), (((M7_<I1_>)->G1.A<Int64>))->(G2_, G3_), (((M7_<I1_>)->Int64))->(G2_, G3_))-> (((M7_<I1_>)->G1_))->(G2_, G3_))
    ]

    let flag1 = compareResult(inputs)
    if (!flag1) {
        return 1
    }
    return 0
}
