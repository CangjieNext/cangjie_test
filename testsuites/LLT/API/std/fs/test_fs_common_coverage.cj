/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Unix) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC: %run %run_opt %output %run_utest_opt

import std.fs.*

/*
 * Branch-focused coverage for std.fs common.cj:
 * exists/removeIfExists Path overloads, copy to new dest, rename Path overload.
 */
@Test
class FsCommonCoverageTest {
    let baseDir: String = "./cov_tmp_fs_common"

    @BeforeAll
    func setupAll(): Unit {
        removeIfExists(baseDir, recursive: true)
        Directory.create(baseDir)
    }

    @AfterAll
    func tearDownAll(): Unit {
        removeIfExists(baseDir, recursive: true)
    }

    func p(name: String): String {
        "${baseDir}/${name}"
    }

    func cleanup(name: String): Unit {
        removeIfExists(p(name), recursive: true)
    }

    @TestCase
    func testExistsAndRemoveIfExistsPathOverload(): Unit {
        let fpath = p("exists.txt")
        cleanup("exists.txt")
        @Expect(exists(Path(fpath)), false)
        @Expect(exists(fpath), false)
        @Expect(removeIfExists(Path(fpath)), false)
        @Expect(removeIfExists(fpath), false)

        File.writeTo(fpath, "x".toArray())
        @Expect(exists(Path(fpath)), true)
        @Expect(exists(fpath), true)
        @Expect(removeIfExists(Path(fpath)), true)
        @Expect(exists(fpath), false)
        @Expect(removeIfExists(fpath), false)
    }

    @TestCase
    func testCopyFileToNewDestination(): Unit {
        let src = p("copy_new_src.txt")
        let dst = p("copy_new_dst.txt")
        cleanup("copy_new_src.txt")
        cleanup("copy_new_dst.txt")
        File.writeTo(src, "payload".toArray())

        copy(Path(src), to: Path(dst))
        @Expect(exists(dst), true)
        var buf = Array<Byte>(20, repeat: 0)
        try (f = File(dst, Read)) {
            let n = f.read(buf)
            @Expect(String.fromUtf8(buf[..n]), "payload")
        }

        cleanup("copy_new_src.txt")
        cleanup("copy_new_dst.txt")
    }

    @TestCase
    func testRenamePathOverload(): Unit {
        let src = p("rename_src.txt")
        let dst = p("rename_dst.txt")
        cleanup("rename_src.txt")
        cleanup("rename_dst.txt")
        File.writeTo(src, "r".toArray())

        rename(Path(src), to: Path(dst))
        @Expect(exists(src), false)
        @Expect(exists(Path(dst)), true)

        cleanup("rename_dst.txt")
    }

    @TestCase
    func testCopySamePathThrows(): Unit {
        let f = p("same_path.txt")
        cleanup("same_path.txt")
        File.writeTo(f, "s".toArray())
        @ExpectThrows[FSException](copy(f, to: f))
        @ExpectThrows[FSException](copy(Path(f), to: Path(f)))
        cleanup("same_path.txt")
    }
}
