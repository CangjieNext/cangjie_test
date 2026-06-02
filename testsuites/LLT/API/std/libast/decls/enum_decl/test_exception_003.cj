// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-2 ASTException: Cannot construct the 'EnumDecl' node.

import std.ast.*
import std.collection.*

main() {
    var cnt = 0
    let tokens1 = quote( 
        public enum A {
            ...
        }
    )
    try {
        let enumDecl1 = EnumDecl(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }
    let tokens2 = quote( 
        public enum A {
            | ...
        }
    )
    try {
        let enumDecl2 = EnumDecl(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    if (cnt != 2) {
        return 1
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
