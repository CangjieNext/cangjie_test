// DEPENDENCE: sourceFile/import_list.cj
// (not Windows) EXEC: dos2unix import_list.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var importLists = Array<ImportList>()

    @BeforeAll
    func readImportLists(): Unit {
        let node = parseFile("import_list.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        importLists =  file.importLists
    }

    @TestCase
    func testModifier01() {
        let importList = importLists[0]
        @Expect(importList.modifier.isNone())
        @Expect(importList.toString(), "import testPackage")
        var pos = importList.getImportKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 7]).toArray())
        pos = importList.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 19]).toArray())
    }

    @TestCase
    func testModifier02() {
        let importList = importLists[1]
        let modifier = importList.modifier.getOrThrow()
        match(modifier.kind) {
            case ModifierKind.Private => @Expect(true)
            case _ => @Expect(false)
        }
        @Expect(importList.toString(), "private import testPackage")
        @Expect(importList.toTokens().toString(), "private import testPackage")
        var pos = importList.getImportKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 9, 2, 15]).toArray())
    }

    @TestCase
    func testModifier03() {
        let importList = importLists[2]
        let modifier = importList.modifier.getOrThrow()
        match(modifier.kind) {
            case ModifierKind.Protected => @Expect(true)
            case _ => @Expect(false)
        }
        @Expect(importList.toString(), "protected import testPackage")
        var pos = importList.getImportKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 11, 3, 17]).toArray())
    }

    @TestCase
    func testModifier04() {
        let importList = importLists[3]
        let modifier = importList.modifier.getOrThrow()
        match(modifier.kind) {
            case ModifierKind.Internal=> @Expect(true)
            case _ => @Expect(false)
        }
        @Expect(importList.toString(), "internal import testPackage")
        var pos = importList.getImportKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 10, 4, 16]).toArray())
    }

    @TestCase
    func testModifier05() {
        let importList = importLists[4]
        let modifier = importList.modifier.getOrThrow()
        match(modifier.kind) {
            case ModifierKind.Public => @Expect(true)
            case _ => @Expect(false)
        }
        @Expect(importList.toString(), "public import testPackage")
        var pos = importList.getImportKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 8, 5, 14]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("import_list.cj")
        let input = String.fromUtf8(File.readFrom("import_list.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let tmp = importLists[0]
        let importList = ImportList(tmp.contents, tmp.modifier)
        @Expect(importList.modifier.isNone())
        @Expect(importList.toString(), "import testPackage")
        var pos = importList.getImportKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 7]).toArray())
        pos = importList.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 19]).toArray())
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
