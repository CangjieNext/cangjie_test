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
        var expr = parseExpr(input)
        var b = match (expr as MatchExpr) {
            case Some(v) => v
            case None => throw Exception("Not MatchExpr")
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
        quote(
                match {
                case a is B => a is B
                case -b => -b
                case (A) => (A)
                case obj(a) => obj(a)
                case _ => 0
            }),
        quote(
                match (a(){3}) {
                case 10 where (true) => a(){3}
                case 10 where (true) => spawn {x}
                case 10 where (true) => synchronized(mtx2) {}
                case 10 where (true) => ()
            }),
        quote(
                match (A) {
                case 10 where (true) => var a: A = b
                case 10 where (true) => func foo<T>(a:T,b!:Int64=1):Int64 where T<: B {}
             })
    ]

    let flag1 = compareResult(inputs)
    if (!flag1) {
        return 1
    }
    return 0
}
