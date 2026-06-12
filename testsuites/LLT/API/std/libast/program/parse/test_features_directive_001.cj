/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.{Program, Visitor, ASTException, parseProgram}

class MyVisitor <: Visitor {
    public override func visit(_: Program) {
        println("Inside Program")
    }
}

main() {
    try {
        Program(quote(
            1 + 1
        ))
    } catch (_: ASTException) {
        println("Invalid Program")
    }

    let program0 = parseProgram(quote(
        features {os.Mac}
    ))
    let ftr0 = program0.featuresDirective
    ftr0?.toTokens() |> println
    program0.toTokens() |> println
    program0.traverse(MyVisitor())

    let program1 = parseProgram(quote(
        features {os.Mac}
    ))
    let ftr1 = program1.featuresDirective
    ftr1?.toTokens() |> println
}

/* SCAN
Invalid Program
Some(features { os.Mac }
)
features { os.Mac }

Inside Program
Some(features { os.Mac }
)
*/