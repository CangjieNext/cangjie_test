/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan neg-nonmacro throw
// ASSERT: scan neg-single-when throw
// ASSERT: scan empty-block 1 true 0
// ASSERT: scan empty-traverse 1 0

// Boundary and negative-path guards for the std.ast macro import
// adaptation: illegal forms must raise a parse exception instead of
// crashing or silently building nodes, and an empty block must rebuild
// as a block-form list with zero items.

import std.ast.*

class MiVisitor <: Visitor {
    var lists = 0
    var specs = 0
    public override func visit(_: MacroImportList): Unit {
        lists++
    }
    public override func visit(_: MacroImportSpec): Unit {
        specs++
    }
}

func expectParseError(code: String, tag: String): Unit {
    try {
        parseProgram(cangjieLex(code))
        println("${tag} no-throw")
    } catch (e: Exception) {
        println("${tag} throw")
    }
}

main() {
    expectParseError("package a\nmacro import p\n", "neg-nonmacro")
    expectParseError("macro package m\n@When[os == \"linux\"] macro import p\n", "neg-single-when")

    let empty = parseProgram(cangjieLex("macro package m\nmacro {\n}\n")).macroImports
    println("empty-block ${empty.size} ${empty[0].isBlockForm()} ${empty[0].items.size}")
    let v = MiVisitor()
    parseProgram(cangjieLex("macro package m\nmacro {\n}\n")).traverse(v)
    println("empty-traverse ${v.lists} ${v.specs}")
}
