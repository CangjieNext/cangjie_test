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
import std.unicode.*

main() {
    var input: Tokens = quote(private var a: Int32)
    let expr = parseDecl(input)
    if (expr is VarDecl) {
        var b = match (expr as VarDecl) {
            case Some(v) => v
            case None => throw Exception("Not VarDecl")
        }

        var modiValue = b.modifiers[0].keyword.value
        var varValue = b.keyword.value
        var aValue = b.identifier.value

        if (modiValue != "private" || varValue != "var" || aValue != "a") {
            return 1
        }
        return 0
    }
    return 5
}
