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
        var b = match (expr as BinaryExpr) {
            case Some(v) => v
            case None => throw Exception("Not BinaryExpr")
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
        quote(1+a),
        quote(a+b+c),
        quote(!1+-a),
        quote((1)+(a)),
        quote(a()+b()),
        quote(a.b+c.d),
        quote(if (true){}+if (false){}),
        quote(1-a),
        quote(1**a),
        quote(1*a),
        quote(1%a),
        quote(1<<a),
        quote(1<a),
        quote(1<=a),
        quote(1>a),
        quote(1==a),
        quote(1!=a),
        quote(1&&a),
        quote(1&a),
        quote(1||a),
        quote(1|a),
        quote(1^a)
    ]

    let flag1 = compareResult(inputs)
    if (!flag1) {
        return 1
    }
    return 0
}
