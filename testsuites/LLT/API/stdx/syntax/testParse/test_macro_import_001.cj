/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: sourceFile/test_macro_import_src.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

// stdx.syntax adaptation for the 'macro import' feature: parseFile exposes
// SourceFile.macroImports (MacroImportList/MacroImportSpec), toTokens keeps
// the 'macro' keyword for the single form, and ASTVisitor.walk dispatches
// to the macro import nodes.

import stdx.syntax.*

class CountMacroImport <: ASTVisitor {
    var lists = 0
    var specs = 0
    override public func postAction(node: SyntaxTreeNode): PostActionMode {
        return match (node) {
            case _: MacroImportList => lists++
            PostActionMode.Continue
            case _: MacroImportSpec => specs++
            PostActionMode.Continue
            case _ => PostActionMode.Continue
        }
    }
}

func tokensToString(tks: Tokens): String {
    var ret = ""
    for (t in tks) {
        ret += t.value
    }
    return ret
}

@Test
class TestMacroImport {
    var file = Option<SourceFile>.None

    @BeforeAll
    func readFile(): Unit {
        let node = parseFile("test_macro_import_src.cj")
        file = node.node.getOrThrow() as SourceFile
    }

    @TestCase
    func testParseForms(): Unit {
        let mis = (file.getOrThrow()).macroImports
        @Expect(mis.size, 2)

        let single = mis[0]
        @Expect(single.isBlock, false)
        @Expect(single.items.size, 1)
        let spec = single.items[0]
        @Expect(spec.annotations.size, 0)
        match (spec.contents) {
            case s: ImportSingle => @Expect(s.identifier, "p")
            case _ => @FailExpect("single form expected")
        }

        let blk = mis[1]
        @Expect(blk.isBlock, true)
        @Expect(blk.items.size, 3)
        @Expect(blk.items[0].annotations.size, 1)
        @Expect(blk.items[1].annotations.size, 0)
        @Expect(blk.items[2].annotations.size, 0)
        match (blk.items[1].contents) {
            case _: ImportAll => ()
            case _ => @FailExpect("all form expected")
        }
        match (blk.items[2].contents) {
            case a: ImportAlias => @Expect(a.identifier, "r")
            case _ => @FailExpect("alias form expected")
        }
    }

    @TestCase
    func testToTokens(): Unit {
        let mis = (file.getOrThrow()).macroImports
        let singleTks = mis[0].toTokens()
        @Expect(singleTks[0].value, "macro")
        @Expect(tokensToString(singleTks), "macroimportp")
    }

    @TestCase
    func testVisitorWalk(): Unit {
        let visit = CountMacroImport()
        visit.walk(file.getOrThrow())
        @Expect(visit.lists, 2)
        @Expect(visit.specs, 4)
    }
}
