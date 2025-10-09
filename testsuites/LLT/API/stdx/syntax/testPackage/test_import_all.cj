// DEPENDENCE: sourceFile/import_all.cj
// (not Windows) EXEC: dos2unix import_all.cj
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
        let node = parseFile("import_all.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        importLists =  file.importLists
    }

    @TestCase
    func test01() {
        let importList = importLists[0]
        match(importList.kind) {
            case ImportKind.All => @Expect(true)
            case _ => @Expect(false)
        }
        let content = (importList.contents as ImportAll).getOrThrow()
        @Expect(content.prefixes, ["a"])
        @Expect(content.toString(), "a.*")
        var pos = content.getMulPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 10, 1, 11]).toArray())
        pos = content.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 11]).toArray())
    }

    @TestCase
    func test02() {
        let importList = importLists[1]
        match(importList.kind) {
            case ImportKind.All => @Expect(true)
            case _ => @Expect(false)
        }

        let content = (importList.contents as ImportAll).getOrThrow()
        @Expect(content.prefixes, ["a", "b"])
        @Expect(content.toString(), "a.b.*")
        var pos = content.getMulPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 12, 2, 13]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("import_all.cj")
        let input = String.fromUtf8(File.readFrom("import_all.cj"))
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
