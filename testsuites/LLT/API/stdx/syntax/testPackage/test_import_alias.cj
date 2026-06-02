/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/import_alias.cj
// (not Windows) EXEC: dos2unix import_alias.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var importLists: Array<ImportList> = []

    @BeforeAll
    func readImportLists(): Unit {
        let node = parseFile("import_alias.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        importLists =  file.importLists
    }

    @TestCase
    func test01() {
        let importList = importLists[0]
        match(importList.kind) {
            case ImportKind.Alias => @Expect(true)
            case _ => @Expect(false)
        }

        let content = (importList.contents as ImportAlias).getOrThrow()
        @Expect(content.prefixes, [])
        @Expect(content.identifier, "testPackage")
        @Expect(content.aliasName, "pkg")
        @Expect(content.toString().replace("\r\n", "\n"), "testPackage as pkg")
        @Expect(content.toTokens().toString().replace("\r\n", "\n"), "testPackage as pkg")
        var pos = content.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 19]).toArray())
        pos = content.getAsPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 20, 1, 22]).toArray())
        pos = content.getAliasNamePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 23, 1, 26]).toArray())
        pos = content.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 26]).toArray())
    }

    @TestCase
    func test02() {
        let importList = importLists[1]
        match(importList.kind) {
            case ImportKind.Alias => @Expect(true)
            case _ => @Expect(false)
        }

        let content = (importList.contents as ImportAlias).getOrThrow()
        @Expect(content.prefixes, ["a"])
        @Expect(content.identifier, "testPackage")
        @Expect(content.aliasName, "pkg")
        @Expect(content.toString().replace("\r\n", "\n"), "a.testPackage as pkg")
        var pos = content.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 10, 2, 21]).toArray())
        pos = content.getAsPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 22, 2, 24]).toArray())
        pos = content.getAliasNamePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 25, 2, 28]).toArray())
    }

    @TestCase
    func test03() {
        let importList = importLists[2]
        match(importList.kind) {
            case ImportKind.Alias => @Expect(true)
            case _ => @Expect(false)
        }

        let content = (importList.contents as ImportAlias).getOrThrow()
        @Expect(content.prefixes, ["a", "b"])
        @Expect(content.identifier, "testPackage")
        @Expect(content.aliasName, "pkg")
        @Expect(content.toString().replace("\r\n", "\n"), "a.b.testPackage as pkg")
        var pos = content.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 12, 3, 23]).toArray())
        pos = content.getAsPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 24, 3, 26]).toArray())
        pos = content.getAliasNamePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 27, 3, 30]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("import_alias.cj")
        let input = String.fromUtf8(File.readFrom("import_alias.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let importList = importLists[0]
        match(importList.kind) {
            case ImportKind.Alias => @Expect(true)
            case _ => @Expect(false)
        }
        let tmp = (importList.contents as ImportAlias).getOrThrow()
        let content = ImportAlias(tmp.prefixes, tmp.identifier, tmp.aliasName)
        @Expect(content.prefixes, [])
        @Expect(content.identifier, "testPackage")
        @Expect(content.aliasName, "pkg")
        @Expect(content.toString().replace("\r\n", "\n"), "testPackage as pkg")
        var pos = content.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 12]).toArray())
        pos = content.getAsPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 13, 1, 15]).toArray())
        pos = content.getAliasNamePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 16, 1, 19]).toArray())
        pos = content.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 19]).toArray())
    }

    @TestCase
    func testInit02() {
        let importList = importLists[2]
        match(importList.kind) {
            case ImportKind.Alias => @Expect(true)
            case _ => @Expect(false)
        }
        let tmp = (importList.contents as ImportAlias).getOrThrow()
        let content = ImportAlias(tmp.prefixes, tmp.identifier, tmp.aliasName)
        @Expect(content.prefixes, ["a", "b"])
        @Expect(content.identifier, "testPackage")
        @Expect(content.aliasName, "pkg")
        @Expect(content.toString().replace("\r\n", "\n"), "a.b.testPackage as pkg")
    }
}

