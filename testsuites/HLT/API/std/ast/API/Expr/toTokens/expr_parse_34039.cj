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
        var b = match (expr as ForInExpr) {
            case Some(v) => v
            case None => throw Exception("Not ForInExpr")
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
        quote(for (item in list where (c)) {}),
        quote(for (A(x) in list) {}),
        quote(for (_ in list where (c)) {}),
        quote(for ((x, y) in list where (c)) {}),
        quote(for (i in try {} catch(_) {} finally {} where (try {} catch(_) {} finally {})){ try {} catch(_) {} finally {}})
    ]

    let flag1 = compareResult(inputs)
    if (!flag1) {
        return 1
    }
    return 0
}
