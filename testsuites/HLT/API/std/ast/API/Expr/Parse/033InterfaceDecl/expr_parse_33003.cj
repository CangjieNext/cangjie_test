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

main(): Int64 {
    var input: Tokens = quote(
        public interface A <: C & I {}
    )
    let expr = parseDecl(input)
    if (expr is InterfaceDecl) {
        var b = match (expr as InterfaceDecl) {
            case Some(v) => v
            case None => throw Exception("Not InterfaceDecl")
        }
        var mValue = match (b.modifiers[0] as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        if (mValue != "public") {
            return 2
        }
        if (b.keyword.value != "interface") {
            return 3
        }
        if (b.identifier.value != "A") {
            return 4
        }
        if (b.body.decls.size != 0) {
            return 5
        }
        var cValue = match (b.superTypes[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (cValue != "C") {
            return 6
        }
        var iValue = match (b.superTypes[1] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (iValue != "I") {
            return 7
        }
        return 0
    }
    return 1
}
