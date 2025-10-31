// DEPENDENCE: sourceFile/package
// (not Windows) EXEC: find package -type f -exec dos2unix {} \;
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*

@Test
class Test {
    @TestCase
    func test_macro_01() {
        let node = parsePackage("package/package_macro")
        let file = (node.node.getOrThrow() as Package).getOrThrow()
        @Expect(file.name, "testPackage")
        @Expect(file.isMacroPkg, true)
    }

    @TestCase
    func test_macro_02() {
        let node = parsePackage("package/package_non_macro")
        let file = (node.node.getOrThrow() as Package).getOrThrow()
        @Expect(file.name, "testPackage")
        @Expect(file.isMacroPkg, false)
    }

    @TestCase
    func test_source_num_01() {
        let node = parsePackage("package/package_source_num_1")
        let file = (node.node.getOrThrow() as Package).getOrThrow()
        @Expect(file.name, "testPackage")
        @Expect(file.srcFile.size, 1)
    }

    @TestCase
    func test_source_num_02() {
        let node = parsePackage("package/package_source_num_2")
        let file = (node.node.getOrThrow() as Package).getOrThrow()
        @Expect(file.name, "testPackage")
        @Expect(file.srcFile.size, 2)
    }

    @TestCase
    func testPackageInit() {
        let node = parsePackage("package/package_source_num_2")
        let file = (node.node.getOrThrow() as Package).getOrThrow()
        let packageNode = Package(file.isMacroPkg, file.name, file.srcFile)
        @Expect(packageNode.name, "testPackage")
        @Expect(packageNode.srcFile.size, 2)
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
