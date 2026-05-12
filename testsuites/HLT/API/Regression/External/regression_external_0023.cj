/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %overflow_wrapping %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-not BaseFunc in CallExpr must be RefExpr

import std.ast.*

main(): Unit {
    let input = quote(
func run(): Int64 {
    var x:Int32 = 10
    var y = 10
    var a3:()->Unit = foo3
    var a5:(()->Unit)->()->Unit = foo5
    a5(a3)()
    return 1
})
    let expr = parseDecl(input)
    println("ok")
}
