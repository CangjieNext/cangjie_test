// (not Windows) EXEC-PIPE-0: %pwd_to_ld_path %compiler %cmp_opt -Woff unused %n.cj %macro_lib -o %output
// (not Windows) RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main() {
    let a1 = quote(var a = r'R')
    println(a1)
    let a2 = parseDecl(a1)
    println(a2.toTokens())
    let a3 = cangjieLex("var a = r'R'")
    println(a3)

    println("------------")
    let b1 = quote(var a = r"R")
    println(b1)
    let b2 = parseDecl(b1)
    println(b2.toTokens())
    let b3 = cangjieLex('var a = r"R"')
    println(b3)
}

/* SCAN-IN
var a = r'R'
var a = r'R'

var a = r'R'
------------
var a = r"R"
var a = r"R"

var a = r"R"
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
