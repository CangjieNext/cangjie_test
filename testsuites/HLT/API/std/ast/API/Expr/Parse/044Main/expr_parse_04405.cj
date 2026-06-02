/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    var d = parseDecl(quote(main(a:A,b!:B,c!:C=C()):D{var x = 1}))
    if (d is MainDecl) {
        var mainDecl = match (d as MainDecl) {
            case Some(v) => v
            case None => throw Exception("Not MainDecl")
        }

        if (mainDecl.funcParams[0].identifier.value != "a") {
            return 1
        }
        if (mainDecl.funcParams[1].identifier.value != "b") {
            return 2
        }
        if (mainDecl.funcParams[2].identifier.value != "c") {
            return 3
        }

        var callDecl = match (mainDecl.funcParams[2].expr as CallExpr) {
            case Some(v) => v
            case None => throw Exception("Not Call Decl")
        }
    }
    return 0
}
