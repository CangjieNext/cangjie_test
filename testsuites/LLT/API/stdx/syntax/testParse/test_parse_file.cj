/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile
// EXEC: ln -s sourceFile/test_file.cj sourceFile/test_file_ln.cj
// EXEC: chmod 000 sourceFile/test_file_chmod.cj
// (not Windows) EXEC: find sourceFile -type f -exec dos2unix {} \;
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.regex.*
import std.collection.ArrayList

@Test
class Test {
    @TestCase
    func testNormal() {
        let node = parseFile("sourceFile/test_file.cj")
        let input = String.fromUtf8(File.readFrom("sourceFile/test_file.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
        @Expect(node.diags.size, 0)
        @Expect(file.path.contains("sourceFile/test_file.cj"), true)
        @Expect(file.parentNode.isNone(), true)
    }

    @TestCase
    func testSpace() {
        let node = parseFile("sourceFile/test file.cj")
        let input = String.fromUtf8(File.readFrom("sourceFile/test file.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
        @Expect(file.path.contains("sourceFile/test file.cj"), true)
    }

    @TestCase
    func testNumberSign() {
        let node = parseFile("sourceFile/test#file.cj")
        let input = String.fromUtf8(File.readFrom("sourceFile/test#file.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
        @Expect(file.path.contains("sourceFile/test#file.cj"), true)
    }

    @TestCase
    func testNotExisted() {
        var count = 0
        let path = "sourceFile/file.cj"
        try {
            let node = parseFile(path)
        } catch (e: Exception) {
            count += 1
            @Expect(e.message, "IOException: Failed to canonical: the input path `${path}` may not exist or permission denied!")
        }
        @Expect(count, 1)
    }

    @TestCase
    func testNotFile() {
        var count = 0
        try {
            let node = parseFile("sourceFile")
        } catch (e: Exception) {
            count += 1
            @Expect(e.message, "IOException: The file extension of the source file must be 'cj'.")
        }
        @Expect(count, 1)
    }

    @TestCase
    func testNotCjc() {
        var count = 0
        try {
            let node = parseFile("sourceFile/test_file.txt")
        } catch (e: Exception) {
            count += 1
            @Expect(e.message, "IOException: The file extension of the source file must be 'cj'.")
        }
        @Expect(count, 1)
    }

    @TestCase
    func testNotRealFile() {
        var count = 0
        let path = "sourceFile/test_file_ln.cj"
        try {
            let node = parseFile(path)
        } catch (e: Exception) {
            count += 1
            @Expect(e.message, "IOException: Failed to canonical path `${path}` return -2: \"No such file or directory\".")
        }
        @Expect(count, 1)
    }

    @TestCase
    func testLongFile() {
        let node = parseFile("sourceFile/test_________________________________________________________________________________________________________________________________________________________________________________file.cj")
        let input = String.fromUtf8(File.readFrom("sourceFile/test_________________________________________________________________________________________________________________________________________________________________________________file.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
        @Expect(file.path.contains("sourceFile/test_________________________________________________________________________________________________________________________________________________________________________________file.cj"), true)
    }

    @TestCase
    func testGbkFile() {
        let filePath = "sourceFile/test_file_gbk.cj"
        let node = parseFile(filePath)
        @Expect(node.diags.size, 2)
        var canPath: String = canonicalize(filePath).toString()
        let r = Regex("(?:\u{001b})[[0-9]*m")
        let hint_msg = "^ illegal byte in UTF-8 encoding"
 
        let diags = node.diags
        @Expect(diags.size, 2)
        match(diags[0].diagInfo) {
            case Error(err, hint) =>
            println(hint)
                @Expect(r.replaceAll(err, ""), "illegal byte '0b10110001' in UTF-8 encoding")
                @Expect(r.replaceAll(hint, "").contains(hint_msg))
                var pos = diags[0].codePos
                @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 9, 4, 10]).toArray())
                @Expect(pos.fileName, "test_file_gbk.cj")
                @Expect(pos.filePath.contains("test_file_gbk.cj"))
            case _=> throw Exception("not error")
        }
        match(diags[1].diagInfo) {
            case Error(err, hint) =>
            println(hint)
                @Expect(r.replaceAll(err, ""), "illegal byte '0b11000001' in UTF-8 encoding")
                @Expect(r.replaceAll(hint, "").contains(hint_msg))
                var pos = diags[1].codePos
                @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 10, 4, 11]).toArray())
                @Expect(pos.fileName, "test_file_gbk.cj")
                @Expect(pos.filePath.contains("test_file_gbk.cj"))
            case _=> throw Exception("not error")
        }
    }

    @TestCase
    func testNoPermissionFile() {
        var count = 0
        try {
            let node = parseFile("sourceFile/test_file_chmod.cj")
        } catch (e: Exception) {
            count += 1
            @Expect(e.message, "IOException: The file is not readable.")
        }
        @Expect(count, 1)
    }

    @TestCase
    func testWarning1() {
        let node = parseFile("sourceFile/test_warning_1.cj")
        let input = String.fromUtf8(File.readFrom("sourceFile/test_warning_1.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
        @Expect(node.diags.size, 1)
        match (node.diags[0].diagInfo) {
            case DiagnosticInfo.Warning(s1, s2) => ()
            case _ => @FailExpect("wrong diag kind")
        }
        @Expect(file.path.contains("sourceFile/test_warning_1.cj"), true)
    }

    @TestCase
    func testWarning2() {
        let node = parseFile("sourceFile/test_warning_2.cj")
        let input = String.fromUtf8(File.readFrom("sourceFile/test_warning_2.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
        @Expect(node.diags.size, 2)
        match (node.diags[0].diagInfo) {
            case DiagnosticInfo.Warning(s1, s2) => ()
            case _ => @FailExpect("wrong diag kind")
        }
        match (node.diags[1].diagInfo) {
            case DiagnosticInfo.Warning(s1, s2) => ()
            case _ => @FailExpect("wrong diag kind")
        }
        @Expect(file.path.contains("sourceFile/test_warning_2.cj"), true)
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
