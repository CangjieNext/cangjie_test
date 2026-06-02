/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %export cjStackSize=1MB && %export JETVMPROP=-Xss2M && %run %run_opt %output %run_args

import std.ast.*

func getSuffix(end: Int64): Tokens {
    var suffix = quote(?)
    for (i in 1..end) {
        suffix = suffix + quote(?)
    }
    return suffix
}

main(): Int64 {
    var len = 2000
    var input: Tokens = quote(
        a is
    )
    input = input + getSuffix(len) + quote(Int64)
    println("before libast parseExpr")
    let expr = parseExpr(input)
    println("after libast parseExpr")
    if (expr is IsExpr) {
        var tp = match (expr as IsExpr) {
            case Some(v) => v.shiftType
            case None => throw Exception("Not IsExpr")
        }

        if (!(tp is PrefixType)) {
            return 2
        }

        var bpExpr = match (tp as PrefixType) {
            case Some(v) => v.baseType
            case None => throw Exception("Not PrefixType")
        }
        var bpValue = match (bpExpr as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (bpValue != "Int64") {
            return 3
        }

        var pfExpr = match (tp as PrefixType) {
            case Some(v) => v.prefixOps
            case None => throw Exception("Not PrefixType")
        }

        if (pfExpr.size != Int64(len)) {
            return 4
        }
        return 0
    }
    return 1
}
