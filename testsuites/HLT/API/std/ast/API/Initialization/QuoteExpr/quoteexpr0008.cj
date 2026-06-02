/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args --no-color 

import std.ast.*

main(): Int64 {
    let strings = ["Quote", "quotes", "qoute"]
    for (str in strings) {
        try {
            let tok = quote("${str}()")
            QuoteExpr(tok)
        } catch (e: ASTException) {
            if (e.message != "Cannot construct the \'QuoteExpr\' node.") {
                return 1
            }
        }
    }
    0
}
