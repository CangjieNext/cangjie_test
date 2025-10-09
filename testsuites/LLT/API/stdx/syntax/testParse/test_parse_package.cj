// DEPENDENCE: sourceFile
// EXEC: mkdir -p sourceFile/parse_dir/test_file_ln/
// EXEC: ln -s sourceFile/parse_dir/test_file/test_file.cj sourceFile/parse_dir/test_file_ln/test_file_ln.cj
// EXEC: chmod 000 sourceFile/parse_dir/test_file_chmod/test_file_chmod.cj
// (not Windows) EXEC: find sourceFile -type f -exec dos2unix {} \;
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*

@Test
class Test {
    @TestCase
    func testNormal() {
        let node = parsePackage("sourceFile/parse_dir/test_file")
        let pkg = (node.node.getOrThrow() as Package).getOrThrow()
        @Expect(node.diags.size, 0)
        @Expect(pkg.srcFile.size, 1)
        @Expect(pkg.srcFile[0].path.contains("sourceFile/parse_dir/test_file/test_file.cj"), true)
        @Expect(pkg.srcFile[0].parentNode.getOrThrow() is Package, true)
    }

    @TestCase
    func testSpace() {
        let node = parsePackage("sourceFile/parse_dir/test file")
        let pkg = (node.node.getOrThrow() as Package).getOrThrow()
        @Expect(pkg.srcFile.size, 1)
        @Expect(pkg.srcFile[0].path.contains("sourceFile/parse_dir/test file/test file.cj"), true)
    }

    @TestCase
    func testNumberSign() {
        let node = parsePackage("sourceFile/parse_dir/test#file")
        let pkg = (node.node.getOrThrow() as Package).getOrThrow()
        @Expect(pkg.srcFile.size, 1)
        @Expect(pkg.srcFile[0].path.contains("sourceFile/parse_dir/test#file/test#file.cj"), true)
    }

    @TestCase
    func testNotExisted() {
        var count = 0
        try {
            let node = parsePackage("sourceFile/parse_dir/file")
        } catch (e: Exception) {
            count += 1
            @Expect(e.message, "IOException: The path `sourceFile/parse_dir/file` does not exist.")
        }
        @Expect(count, 1)
    }

    @TestCase
    func testIsFile() {
        var count = 0
        try {
            let node = parsePackage("sourceFile/parse_dir/test_file/test_file.cj")
        } catch (e: Exception) {
            count += 1
            @Expect(e.message, "IOException: The path 'sourceFile/parse_dir/test_file/test_file.cj' is not a directory!")
        }
        @Expect(count, 1)
    }

    // dir not check cjc in dir
    func testNotCjc() {
        var count = 0
        try {
            let node = parsePackage("sourceFile/parse_dir/test_file_txt")
        } catch (e: Exception) {
            count += 1
            @Expect(e.message, "Illegal argument was encountered while obtaining the Package node.")
        }
        @Expect(count, 1)
    }

    @TestCase
    func testNotRealFile() {
        var count = 0
        try {
            let node = parsePackage("sourceFile/parse_dir/test_file_ln")
        } catch (e: Exception) {
            count += 1
            @Expect(e.message, "IOException: Failed to canonical: \"No such file or directory\".")
        }
        @Expect(count, 1)
    }

    @TestCase
    func testLongFile() {
        let node = parsePackage("sourceFile/parse_dir/test______________________________________________________________________________________________________________________________________________________________________________")
        let pkg = (node.node.getOrThrow() as Package).getOrThrow()
        @Expect(pkg.srcFile.size, 1)
        @Expect(pkg.srcFile[0].path.contains("sourceFile/parse_dir/test______________________________________________________________________________________________________________________________________________________________________________/test_________________________________________________________________________________________________________________________________________________________________________________file.cj"), true)
    }

    @TestCase
    func testGbkFile() {
        let node = parsePackage("sourceFile/parse_dir/test_file_gbk")
        @Expect(node.diags.size, 2)
    }

    @TestCase
    func testNoPermissionFile() {
        var count = 0
        try {
            let node = parsePackage("sourceFile/parse_dir/test_file_chmod")
        } catch (e: Exception) {
            count += 1
            @Expect(e.message, "IOException: The file is not readable.")
        }
        @Expect(count, 1)
    }

    @TestCase
    func testWarning1() {
        let node = parsePackage("sourceFile/parse_dir/test_warning_1")
        let pkg = (node.node.getOrThrow() as Package).getOrThrow()
        @Expect(node.diags.size, 1)
        match (node.diags[0].diagInfo) {
            case DiagnosticInfo.Warning(s1, s2) => ()
            case _ => @FailExpect("wrong diag kind")
        }
        @Expect(pkg.srcFile.size, 1)
        @Expect(pkg.srcFile[0].path.contains("sourceFile/parse_dir/test_warning_1/test_warning_1.cj"), true)
    }

    @TestCase
    func testWarning2() {
        let node = parsePackage("sourceFile/parse_dir/test_warning_2")
        let pkg = (node.node.getOrThrow() as Package).getOrThrow()
        @Expect(node.diags.size, 2)
        match (node.diags[0].diagInfo) {
            case DiagnosticInfo.Warning(s1, s2) => ()
            case _ => @FailExpect("wrong diag kind")
        }
        match (node.diags[1].diagInfo) {
            case DiagnosticInfo.Warning(s1, s2) => ()
            case _ => @FailExpect("wrong diag kind")
        }
        @Expect(pkg.srcFile.size, 2)
        @Expect(pkg.srcFile[0].path.contains("sourceFile/parse_dir/test_warning_2/test_warning_file_1.cj"), true)
        @Expect(pkg.srcFile[1].path.contains("sourceFile/parse_dir/test_warning_2/test_warning_file_2.cj"), true)
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
