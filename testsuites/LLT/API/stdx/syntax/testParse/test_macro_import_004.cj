/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

// Constructor API for macro import nodes: the block form must be expressed
// explicitly via 'isBlock' (a single-item block, an empty block 'macro {}' and
// a multi-item block are all constructible), the single form accepts exactly
// one annotation-free item, and positional curl APIs return None for the
// single form.

import stdx.syntax.*

func tokensToString(tks: Tokens): String {
    var ret = ""
    for (t in tks) {
        ret += t.value
    }
    return ret
}

@Test
class TestMacroImportConstruct {
    @TestCase
    func testSingleFormByDefault(): Unit {
        let single = MacroImportList([MacroImportSpec(ImportSingle([], "a"))])
        @Expect(single.isBlock, false)
        @Expect(single.items.size, 1)
        @Expect(single.getLCurlPos().isNone(), true)
        @Expect(single.getRCurlPos().isNone(), true)
        @Expect(tokensToString(single.toTokens()), "macroimporta")
    }

    @TestCase
    func testSingleItemBlock(): Unit {
        let blk = MacroImportList([MacroImportSpec(ImportSingle([], "a"))], isBlock: true)
        @Expect(blk.isBlock, true)
        @Expect(blk.items.size, 1)
        @Expect(blk.getLCurlPos().isSome(), true)
        @Expect(blk.getRCurlPos().isSome(), true)
        @Expect(tokensToString(blk.toTokens()), "macro{importa}")
    }

    @TestCase
    func testEmptyBlock(): Unit {
        let blk = MacroImportList([], isBlock: true)
        @Expect(blk.isBlock, true)
        @Expect(blk.items.size, 0)
        @Expect(tokensToString(blk.toTokens()), "macro{}")
    }

    @TestCase
    func testMultiItemBlockByDefault(): Unit {
        let blk = MacroImportList([MacroImportSpec(ImportSingle([], "a")), MacroImportSpec(ImportSingle([], "b"))])
        @Expect(blk.isBlock, true)
        @Expect(blk.items.size, 2)
        @Expect(tokensToString(blk.toTokens()), "macro{importaimportb}")
    }

    @TestCase
    func testWhenSpecInBlock(): Unit {
        let spec = MacroImportSpec(ImportSingle([], "a"), annotations: [Annotation([], "When", AtOpKind.At)])
        let blk = MacroImportList([spec], isBlock: true)
        @Expect(blk.items[0].annotations.size, 1)
    }

    @TestCase
    func testSingleFormRejectsMultipleItems(): Unit {
        var thrown = false
        try {
            MacroImportList([MacroImportSpec(ImportSingle([], "a")), MacroImportSpec(ImportSingle([], "b"))],
                isBlock: false)
        } catch (e: IllegalArgumentException) {
            thrown = true
        }
        @Expect(thrown, true)
    }

    @TestCase
    func testSingleFormRejectsEmptyItems(): Unit {
        var thrown = false
        try {
            MacroImportList([], isBlock: false)
        } catch (e: IllegalArgumentException) {
            thrown = true
        }
        @Expect(thrown, true)
    }

    @TestCase
    func testSingleFormRejectsWhen(): Unit {
        var thrown = false
        try {
            MacroImportList([MacroImportSpec(ImportSingle([], "a"), annotations: [Annotation([], "When", AtOpKind.At)])],
                isBlock: false)
        } catch (e: IllegalArgumentException) {
            thrown = true
        }
        @Expect(thrown, true)
    }
}
