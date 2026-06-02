// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-2 ASTException: Cannot construct the 'MacroDecl' node.

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        public macro X(input1:Tokens, input2:Tokens, input3:Tokens){
            return input
        }
    )
    try {
        let macroDecl1 = MacroDecl(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        public macro(input:Tokens){
            return input
        }
    )
    try {
        let macroDecl2 = MacroDecl(tokens2)
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
