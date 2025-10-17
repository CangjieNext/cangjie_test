/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*

class TestVisitor <: Visitor {
    override public func visit(block: Block) {
        println("Visiting block")
    }
}

main(): Unit {
    let input = quote(
        func foo() {
            var x = 1
        }
    )
    let program = parseProgram(input)
    let visitor = TestVisitor()
    program.traverse(visitor)
}