/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: sourceFile/test_macro_import_neg_nonmacro.cj sourceFile/test_macro_import_neg_single_when.cj sourceFile/test_macro_import_empty_block.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

// Boundary and negative-path guards for the stdx.syntax macro import
// adaptation: illegal forms must be rejected (no tree is built) instead
// of crashing, and an empty block must round-trip as a block-form list
// with zero items.

import stdx.syntax.*

@Test
class TestMacroImportNeg {
    @TestCase
    func testNonMacroPkgRejected(): Unit {
        let res = parseFile("test_macro_import_neg_nonmacro.cj")
        @Expect(res.node.isNone())
    }

    @TestCase
    func testSingleWhenRejected(): Unit {
        let res = parseFile("test_macro_import_neg_single_when.cj")
        @Expect(res.node.isNone())
    }

    @TestCase
    func testEmptyBlock(): Unit {
        let res = parseFile("test_macro_import_empty_block.cj")
        let file = (res.node.getOrThrow() as SourceFile).getOrThrow()
        let mis = file.macroImports
        @Expect(mis.size, 1)
        @Expect(mis[0].isBlock, true)
        @Expect(mis[0].items.size, 0)
    }
}
