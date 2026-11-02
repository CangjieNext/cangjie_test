/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan rt-single eq
// ASSERT: scan rt-all eq
// ASSERT: scan rt-alias eq
// ASSERT: scan rt-multi eq
// ASSERT: scan rt-multi-is true
// ASSERT: scan rt-when 1 true
// ASSERT: scan rt-when-item @When[os==linux]importp
// ASSERT: scan rt-mixed 3 false true false
// ASSERT: scan rt-order M I I M I
// ASSERT: scan rt-order-id a c e
// ASSERT: scan neg-multi-item throw
// ASSERT: scan neg-single-when throw
// ASSERT: scan neg-empty throw
// ASSERT: scan init-list p false
// ASSERT: scan init-list-block 1 true
// ASSERT: scan init-spec p false
// ASSERT: scan init-spec-when 1

// Round-trip (parseProgram -> toTokens -> parseProgram) tests for the std.ast
// macro import adaptation: all import forms stay structurally equivalent, the
// @When condition survives as an Annotation node and is emitted on one line,
// single/block statements mixed in one file all survive, and interleaved
// macro/ordinary imports keep their source order in Program.toTokens (merged
// on begin positions). Hand-built nodes violating the grammar (multiple items
// or a @When on the single form, or an empty single form) must be rejected by
// toTokens instead of emitting unparsable tokens.

import std.ast.*

func tokensToString(tks: Tokens): String {
    var ret = ""
    for (t in tks) {
        ret += t.value
    }
    return ret
}

func roundTrip(code: String): Program {
    let once = parseProgram(cangjieLex(code))
    return parseProgram(cangjieLex(once.toTokens().toString()))
}

func itemsSignature(list: MacroImportList): String {
    var ret = "${list.isBlockForm()}"
    for (item in list.items) {
        ret += " ${item.content.importKind} ${tokensToString(item.toTokens())}"
    }
    return ret
}

func checkForm(code: String, tag: String): Unit {
    let once = parseProgram(cangjieLex(code))
    let twice = roundTrip(code)
    let s1 = itemsSignature(once.macroImports[0])
    let s2 = itemsSignature(twice.macroImports[0])
    let verdict = if (s1 == s2) {
        "eq"
    } else {
        "neq"
    }
    println("${tag} ${verdict}")
}

main() {
    checkForm("macro package m\nmacro import p\n", "rt-single")
    checkForm("macro package m\nmacro import p.*\n", "rt-all")
    checkForm("macro package m\nmacro import p as q\n", "rt-alias")
    checkForm("macro package m\nmacro import p.{x, y}\n", "rt-multi")
    let multi = parseProgram(cangjieLex("macro package m\nmacro import p.{x, y}\n")).macroImports[0]
    println("rt-multi-is ${multi.items[0].isImportMulti()}")

    // @When round-trip: the annotation survives and is emitted on one line.
    let whenCode = "macro package m\nmacro {\n@When[os == \"linux\"] import p\nimport q.*\n}\n"
    let whenList = roundTrip(whenCode).macroImports[0]
    println("rt-when ${whenList.items[0].annotations.size} ${whenList.isBlockForm()}")
    println("rt-when-item ${tokensToString(whenList.items[0].toTokens())}")

    // Single and block statements mixed: all three survive one round-trip.
    let mixedCode = "macro package m\nmacro import a.b\nmacro {\nimport c.d\n}\nmacro import e.f\n"
    let mixed = roundTrip(mixedCode).macroImports
    println("rt-mixed ${mixed.size} ${mixed[0].isBlockForm()} ${mixed[1].isBlockForm()} ${mixed[2].isBlockForm()}")

    // Interleaved macro/ordinary imports keep their source order in
    // Program.toTokens: after the package header the token kinds must appear
    // as M I I M I and the imported packages as a c e.
    let ilCode = "macro package m\nmacro import a.b\nimport c.d\nmacro import e.f\n"
    let ilTks = roundTrip(ilCode).toTokens()
    var marks = ""
    var ids = ""
    var seenPackage = false
    var prevImport = false
    for (t in ilTks) {
        if (t.kind == TokenKind.PACKAGE) {
            seenPackage = true
        }
        if (!seenPackage) {
            continue
        }
        if (t.kind == TokenKind.MACRO || t.kind == TokenKind.IMPORT) {
            let mark = if (t.kind == TokenKind.MACRO) {
                "M"
            } else {
                "I"
            }
            marks += "${mark} "
        }
        if (prevImport && t.kind == TokenKind.IDENTIFIER) {
            ids += "${t.value} "
            prevImport = false
        } else if (t.kind == TokenKind.IMPORT) {
            prevImport = true
        } else {
            prevImport = false
        }
    }
    println("rt-order ${marks}")
    println("rt-order-id ${ids}")

    // Hand-built single-form list with two items: emitting both would drop the
    // 'macro' prefix on the second one and turn it into a plain import.
    let two = MacroImportList()
    two.items = ArrayList<MacroImportSpec>(2, {_ => MacroImportSpec()})
    try {
        two.toTokens()
        println("neg-multi-item no-throw")
    } catch (e: Exception) {
        println("neg-multi-item throw")
    }

    // @When on a single-form item is rejected by the parser
    // (macro_import_when_only_in_block); toTokens must refuse it too.
    let whenSingle = MacroImportList()
    let spec = MacroImportSpec()
    spec.annotations = ArrayList<Annotation>(1, {_ => Annotation()})
    whenSingle.items = ArrayList<MacroImportSpec>(1, {_ => spec})
    try {
        whenSingle.toTokens()
        println("neg-single-when no-throw")
    } catch (e: Exception) {
        println("neg-single-when throw")
    }

    // An empty single-form list would emit a bare 'macro' keyword.
    let empty = MacroImportList()
    try {
        empty.toTokens()
        println("neg-empty no-throw")
    } catch (e: Exception) {
        println("neg-empty throw")
    }

    // init(inputs: Tokens) constructors parse the statement/item tokens.
    let li = MacroImportList(cangjieLex("macro import p"))
    println("init-list ${li.items[0].content.identifier.value} ${li.isBlockForm()}")
    let lb = MacroImportList(cangjieLex("macro {\nimport p\n}"))
    println("init-list-block ${lb.items.size} ${lb.isBlockForm()}")
    let si = MacroImportSpec(cangjieLex("import p"))
    println("init-spec ${si.content.identifier.value} ${si.isImportMulti()}")
    let sw = MacroImportSpec(cangjieLex("@When[os == \"linux\"] import p"))
    println("init-spec-when ${sw.annotations.size}")
}
