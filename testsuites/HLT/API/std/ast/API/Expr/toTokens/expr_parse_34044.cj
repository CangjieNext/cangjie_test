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
        var output = expr.toTokens()
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
    var inputs: Array<Tokens> = [quote(
                public class A<T, V> <: C & I where T<:Int32, V<:C & A {
                     A(public var d!: Int64 = 2){
                        super()
                        a = b
                        var c =d
                        func foo() {}
                     }
                     init(a:Int64, b!: String, c!:()->Int64={=>1}){}
                }
            )]

    let flag1 = compareResult(inputs)
    if (!flag1) {
        return 1
    }
    return 0
}
