/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.{MainDecl, Visitor}

class MyVisitor <: Visitor {
    public override func visit(_: MainDecl) {
        println("Inside MainDecl")
    }
}

main() {
    let decl = MainDecl(quote(
        main(args: Array<String>): Int64 {
            println(args)
            0
        }
    ))
    decl.traverse(MyVisitor())
}

/* SCAN
Inside MainDecl
*/