// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroDefinition
// EXEC: %compiler %cmp_macro macroDefinition/macroDefinition.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan I'm in function body
// ASSERT: scan a = 3

package huawei::b

import huawei::b.macro_definition.*

main(): Int64 {
    println("I'm in function body")
    let a: Int64 = @TestDef(1 + 2)
    println("a = ${a}")
    return 0
}