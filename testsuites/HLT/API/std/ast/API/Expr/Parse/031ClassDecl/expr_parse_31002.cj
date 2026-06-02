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

main(): Int64 {
    var input: Tokens = quote(
        class A {}
    )
    let expr = parseDecl(input)
    if (expr is ClassDecl) {
        try {
            var classDecl = match (expr as ClassDecl) {
                case Some(v) => v.genericParam
                case None => throw Exception("Not ClassDecl")
            }
        } catch (e: Exception) {
            return 0
        }
        return 1
    }
    return 1
}
