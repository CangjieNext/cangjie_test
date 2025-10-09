// DEPENDENCE: sourceFile/import_single.cj
// (not Windows) EXEC: dos2unix import_single.cj
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
        let node = parseFile("import_single.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        importLists =  file.importLists
    }

    @TestCase
    func test01() {
        let importList = importLists[0]
        match(importList.kind) {
            case ImportKind.Single => @Expect(true)
            case _ => @Expect(false)
        }

        let content = (importList.contents as ImportSingle).getOrThrow()
        @Expect(content.prefixes, [])
        @Expect(content.identifier, "testPackage")
        @Expect(content.toString(), "testPackage")
        var pos = content.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 19]).toArray())
        pos = content.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 19]).toArray())
    }

    @TestCase
    func test02() {
        let importList = importLists[1]
        match(importList.kind) {
            case ImportKind.Single => @Expect(true)
            case _ => @Expect(false)
        }

        let content = (importList.contents as ImportSingle).getOrThrow()
        @Expect(content.prefixes, ["a"])
        @Expect(content.identifier, "testPackage")
        @Expect(content.toString(), "a.testPackage")
        var pos = content.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 10, 2, 21]).toArray())
        pos = content.getPrefixesPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 8, 2, 9]).toArray())
        pos = content.getDotsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 9, 2, 10]).toArray())
    }

    @TestCase
    func test03() {
        let importList = importLists[2]
        match(importList.kind) {
            case ImportKind.Single => @Expect(true)
            case _ => @Expect(false)
        }
        let content = (importList.contents as ImportSingle).getOrThrow()
        @Expect(content.prefixes, ["a", "b"])
        @Expect(content.identifier, "testPackage")
        @Expect(content.toString(), "a.b.testPackage")
        var pos = content.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 12, 3, 23]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("import_single.cj")
        let input = String.fromUtf8(File.readFrom("import_single.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
