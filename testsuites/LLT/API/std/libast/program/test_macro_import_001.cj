/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan 1 Single p false
// ASSERT: scan traverse 1 1
// ASSERT: scan block true
// ASSERT: scan block 3 1 0 0
// ASSERT: scan block All Single
// ASSERT: scan alias Alias
// ASSERT: scan multi 2

// std.ast adaptation for the 'macro import' feature: parseProgram builds
// Program.macroImports (MacroImportList/MacroImportSpec) for all import
// forms, and Program.traverse dispatches to the MacroImport visitor hooks.

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

func checkSingle(): Unit {
    let code = "macro package m\nmacro import p\n"
    let prog = parseProgram(cangjieLex(code))
    let mis = prog.macroImports
    let list = mis[0]
    let content = list.items[0].content
    println("1 ${content.importKind} ${content.identifier.value} ${list.isBlockForm()}")
    let v = MiVisitor()
    prog.traverse(v)
    println("traverse ${v.lists} ${v.specs}")
}

func checkBlock(): Unit {
    let code = "macro package m\nmacro {\n@When[os == \"linux\"] import p\nimport q.*\nimport r as s\n}\n"
    let prog = parseProgram(cangjieLex(code))
    let mis = prog.macroImports
    let list = mis[0]
    println("block ${list.isBlockForm()}")
    let items = list.items
    println("block ${items.size} ${items[0].annotations.size} ${items[1].annotations.size} ${items[2].annotations.size}")
    println("block ${items[1].content.importKind} ${items[0].content.importKind}")
    println("alias ${items[2].content.importKind}")
}

func checkMultiStatement(): Unit {
    let code = "macro package m\nmacro import p\nmacro import q.*\n"
    let prog = parseProgram(cangjieLex(code))
    println("multi ${prog.macroImports.size}")
}

main() {
    checkSingle()
    checkBlock()
    checkMultiStatement()
}
