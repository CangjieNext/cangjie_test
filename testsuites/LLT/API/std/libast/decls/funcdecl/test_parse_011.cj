
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
 
import std.ast.*
 
main() {
    let input = quote(
            ~init() {
                println("~init")
            }
    )
    let funcDecl = (parseDecl(input) as FuncDecl).getOrThrow()
    funcDecl.funcParams.add(FuncParam())
    println(funcDecl.toTokens())
}
 
/* SCAN-IN
~init() {
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
