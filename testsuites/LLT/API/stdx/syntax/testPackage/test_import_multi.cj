// DEPENDENCE: sourceFile/import_multi.cj
// (not Windows) EXEC: dos2unix import_multi.cj
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
        let node = parseFile("import_multi.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        importLists =  file.importLists
    }

    @TestCase
    func test01() {
        let importList = importLists[0]
        match(importList.kind) {
            case ImportKind.Multi => @Expect(true)
            case _ => @Expect(false)
        }

        let content = (importList.contents as ImportMulti).getOrThrow()
        @Expect(content.prefixes, [])
        @Expect(content.contents.size, 3)
        @Expect(content.contents[0] is ImportSingle)
        @Expect(content.contents[1] is ImportAll)
        @Expect(content.contents[2] is ImportAlias)
        @Expect(content.contents[0].toString(), "testPackage1")
        @Expect(content.contents[1].toString(), "testPackage2.*")
        @Expect(content.contents[2].toString(), "testPackage3 as pkg")
        @Expect(content.toString(), "{testPackage1, testPackage2.*, testPackage3 as pkg}")
        @Expect(content.toTokens().toString(), "{ testPackage1, testPackage2.*, testPackage3 as pkg }")
        var pos = content.getLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 9]).toArray())
        pos = content.getRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 58, 1, 59]).toArray())
        pos = content.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 21, 1, 22]).toArray())
        pos = content.getCommasPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 37, 1, 38]).toArray())
        pos = content.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 59]).toArray())
    }

    @TestCase
    func test02() {
        let importList = importLists[1]
        match(importList.kind) {
            case ImportKind.Multi => @Expect(true)
            case _ => @Expect(false)
        }

        let content = (importList.contents as ImportMulti).getOrThrow()
        @Expect(content.prefixes, ["a"])
        @Expect(content.contents.size, 3)
        @Expect(content.contents[0] is ImportSingle)
        @Expect(content.contents[1] is ImportAll)
        @Expect(content.contents[2] is ImportAlias)
        @Expect(content.contents[0].toString(), "a1.testPackage1")
        @Expect(content.contents[1].toString(), "a2.testPackage2.*")
        @Expect(content.contents[2].toString(), "a3.testPackage3 as pkg")
        @Expect(content.toString(), "a.{a1.testPackage1, a2.testPackage2.*, a3.testPackage3 as pkg}")
        var pos = content.getLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 10, 2, 11]).toArray())
        pos = content.getRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 69, 2, 70]).toArray())
        pos = content.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 26, 2, 27]).toArray())
        pos = content.getCommasPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 45, 2, 46]).toArray())
    }

    @TestCase
    func test03() {
        let importList = importLists[2]
        match(importList.kind) {
            case ImportKind.Multi => @Expect(true)
            case _ => @Expect(false)
        }

        let content = (importList.contents as ImportMulti).getOrThrow()
        @Expect(content.prefixes, ["a", "b"])
        @Expect(content.contents.size, 3)
        @Expect(content.contents[0] is ImportSingle)
        @Expect(content.contents[1] is ImportAll)
        @Expect(content.contents[2] is ImportAlias)
        @Expect(content.contents[0].toString(), "a1.b1.testPackage1")
        @Expect(content.contents[1].toString(), "a2.b2.testPackage2.*")
        @Expect(content.contents[2].toString(), "a3.b3.testPackage3 as pkg")
        @Expect(content.toString(), "a.b.{a1.b1.testPackage1, a2.b2.testPackage2.*, a3.b3.testPackage3 as pkg}")
        var pos = content.getLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 12, 3, 13]).toArray())
        pos = content.getRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 80, 3, 81]).toArray())
        pos = content.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 31, 3, 32]).toArray())
        pos = content.getCommasPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 53, 3, 54]).toArray())
    }

    @TestCase
    func test04() {
        let importList = importLists[3]
        match(importList.kind) {
            case ImportKind.Multi => @Expect(true)
            case _ => @Expect(false)
        }

        let content = (importList.contents as ImportMulti).getOrThrow()
        @Expect(content.prefixes, [])
        @Expect(content.contents.size, 4)
        @Expect(content.contents[0] is ImportSingle)
        @Expect(content.contents[1] is ImportSingle)
        @Expect(content.contents[2] is ImportSingle)
        @Expect(content.contents[3] is ImportAlias)
        @Expect(content.contents[0].toString(), "a")
        @Expect(content.contents[1].toString(), "b.a")
        @Expect(content.contents[2].toString(), "c.b.a")
        @Expect(content.contents[3].toString(), "d.c.b.a as _d_c_b_a")
        @Expect(content.toString(), "{a, b.a, c.b.a, d.c.b.a as _d_c_b_a,}")
        var pos = content.getLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 8, 4, 9]).toArray())
        pos = content.getRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 44, 4, 45]).toArray())
        pos = content.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 10, 4, 11]).toArray())
        pos = content.getCommasPos()[3]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 43, 4, 44]).toArray())
    }

    @TestCase
    func test05() {
        let importList = importLists[4]
        match(importList.kind) {
            case ImportKind.Multi => @Expect(true)
            case _ => @Expect(false)
        }

        let content = (importList.contents as ImportMulti).getOrThrow()
        @Expect(content.prefixes, [])
        @Expect(content.contents.size, 3)
        @Expect(content.contents[0] is ImportSingle)
        @Expect(content.contents[1] is ImportAlias)
        @Expect(content.contents[2] is ImportAll)
        @Expect(content.contents[0].toString(), "std.time")
        @Expect(content.contents[1].toString(), "std.fs as fileSystem")
        @Expect(content.contents[2].toString(), "std.io.*")
        @Expect(content.toString(), #"{
    std.time,
    std.fs as fileSystem,
    std.io.*,
}"#)
        var pos = content.getLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 8, 5, 9]).toArray())
        pos = content.getRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 1, 9, 2]).toArray())
        pos = content.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 13, 6, 14]).toArray())
        pos = content.getCommasPos()[2]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 13, 8, 14]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("import_multi.cj")
        let input = String.fromUtf8(File.readFrom("import_multi.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let importList = importLists[0]
        match(importList.kind) {
            case ImportKind.Multi => @Expect(true)
            case _ => @Expect(false)
        }

        let tmp = (importList.contents as ImportMulti).getOrThrow()
        let content = ImportMulti(tmp.prefixes, tmp.contents)

        @Expect(content.prefixes, [])
        @Expect(content.contents.size, 3)
        @Expect(content.contents[0] is ImportSingle)
        @Expect(content.contents[1] is ImportAll)
        @Expect(content.contents[2] is ImportAlias)
        @Expect(content.contents[0].toString(), "testPackage1")
        @Expect(content.contents[1].toString(), "testPackage2.*")
        @Expect(content.contents[2].toString(), "testPackage3 as pkg")
        @Expect(content.toString(), "{testPackage1, testPackage2.*, testPackage3 as pkg}")
        var pos = content.getLCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
        pos = content.getRCurlPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 51, 1, 52]).toArray())
        pos = content.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 14, 1, 15]).toArray())
        pos = content.getCommasPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 30, 1, 31]).toArray())
        pos = content.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 52]).toArray())
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
