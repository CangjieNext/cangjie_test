/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 

import std.ast.*

main() {
    let expr1 = parseDecl(quote(main(a:A,b!:B,c!:C=C()):D{var x = 1;x = 2}))
    if (expr1 is MainDecl) {
        var b = match (expr1 as MainDecl) {
            case Some(v) => v
            case None => throw Exception("Not MainDecl")
        }
        var bExpr = match (b.block as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }

        var vExpr = match (bExpr[0] as VarDecl) {
            case Some(v) => v
            case None => throw Exception("Not VarDecl")
        }

        var value1 = vExpr.keyword.value
        if (value1 != "var") {
            return 1
        }

        var value2 = vExpr.identifier.value
        if (value2 != "x") {
            return 2
        }

        var value3 = vExpr.assign.value
        if (value3 != "=") {
            return 3
        }

        var value4 = match (vExpr.expr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (value4 != "1") {
            return 4
        }
        return 0
    }
    return 5
}
