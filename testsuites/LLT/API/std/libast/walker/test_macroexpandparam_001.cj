/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

import std.ast.{Visitor, MacroExpandParam, FuncParam}

class MyVisitor1 <: Visitor {
    public override func visit(_: MacroExpandParam) {
        println("Visiting MacroExpandParam")
    }
}

class MyVisitor2 <: Visitor {
    public override func visit(_: FuncParam) {
        println("Visiting FuncParam")
    }
}

main(): Unit {
    let macroExpandParam = MacroExpandParam()
    
    macroExpandParam.traverse(MyVisitor1())
    macroExpandParam.traverse(MyVisitor2())
}

/* SCAN
Visiting MacroExpandParam
Visiting FuncParam
*/