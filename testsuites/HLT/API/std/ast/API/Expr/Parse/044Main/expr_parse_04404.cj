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
    let expr1 = parseDecl(quote(main(a:A,b:B,c:C):D{var x = 1}))
    if (expr1 is MainDecl) {
        var b = match (expr1 as MainDecl) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not MainDecl")
        }
        if (b != "main") {
            return 1
        }
    }
    return 0
}
