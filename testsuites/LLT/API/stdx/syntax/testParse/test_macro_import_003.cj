/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: sourceFile/test_macro_import_src.cj sourceFile/test_macro_import_empty_block.cj sourceFile/test_macro_import_interleave.cj sourceFile/test_macro_import_multi.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

// Round-trip and rewrite guards for the stdx.syntax macro import adaptation:
// toString() must reproduce the source text (imports and macro imports are
// re-merged in source order), and ASTRewriter.walk on a file containing macro
// imports must not throw or lose nodes (ChildCollector collects the macro
// import nodes in impl-tree order).
//
// Note: toString() does not carry the file-level trailing newline (a
// pre-existing boundary shared with plain files), so round-trip checks strip
// trailing whitespace on both sides.

import stdx.syntax.*
import std.fs.*

class IdentityRewriter <: ASTRewriter {}

func norm(s: String): String {
    return s.replace("\r\n", "\n")
}

func trimEndWs(s: String): String {
    let a = s.toArray()
    var end = a.size
    while (end > 0 && (a[end - 1] == 10 || a[end - 1] == 13 || a[end - 1] == 32)) {
        end--
    }
    return String.fromUtf8(a[0..end])
}

func stripTail(s: String): String {
    return trimEndWs(norm(s))
}

func readSrc(path: String): String {
    return stripTail(String.fromUtf8(File.readFrom(path)))
}

@Test
class TestMacroImportRoundTrip {
    @TestCase
    func testFormsToString(): Unit {
        let input = readSrc("test_macro_import_src.cj")
        let file = (parseFile("test_macro_import_src.cj").node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(stripTail(file.toString()), input)
    }

    @TestCase
    func testEmptyBlockToString(): Unit {
        let input = readSrc("test_macro_import_empty_block.cj")
        let file = (parseFile("test_macro_import_empty_block.cj").node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(stripTail(file.toString()), input)
    }

    @TestCase
    func testInterleavedToString(): Unit {
        let input = readSrc("test_macro_import_interleave.cj")
        let file = (parseFile("test_macro_import_interleave.cj").node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.importLists.size, 2)
        @Expect(file.macroImports.size, 1)
        @Expect(stripTail(file.toString()), input)
    }

    @TestCase
    func testMultiToString(): Unit {
        let input = readSrc("test_macro_import_multi.cj")
        let file = (parseFile("test_macro_import_multi.cj").node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.macroImports.size, 1)
        let spec = file.macroImports[0].items[0]
        @Expect(spec.contents is ImportMulti, true)
        @Expect(stripTail(file.toString()), input)
    }
}

@Test
class TestMacroImportRewrite {
    @TestCase
    func testWalkKeepsStructure(): Unit {
        let input = readSrc("test_macro_import_interleave.cj")
        let file = (parseFile("test_macro_import_interleave.cj").node.getOrThrow() as SourceFile).getOrThrow()
        let walked = IdentityRewriter().walk(file)
        let sf = (walked as SourceFile).getOrThrow()
        @Expect(sf.importLists.size, 2)
        @Expect(sf.macroImports.size, 1)
        @Expect(stripTail(sf.toString()), input)
    }

    @TestCase
    func testWalkBlockWithWhen(): Unit {
        let input = readSrc("test_macro_import_src.cj")
        let file = (parseFile("test_macro_import_src.cj").node.getOrThrow() as SourceFile).getOrThrow()
        let walked = IdentityRewriter().walk(file)
        let sf = (walked as SourceFile).getOrThrow()
        @Expect(sf.macroImports.size, 2)
        @Expect(stripTail(sf.toString()), input)
    }
}
