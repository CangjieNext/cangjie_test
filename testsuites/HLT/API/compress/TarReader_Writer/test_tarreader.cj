/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows)RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import std.io.*
import stdx.compress.tar.*

@Test
class test_TarReader {
    func compareFile(fileName1: String, fileName2: String): Bool {
        return File.readFrom(fileName1) == File.readFrom(fileName2)
    }

    let filepaths = [
        "test_dir/test_file.txt",
        "test_dir/tempfile",
        "symlink"
    ]

    @BeforeAll
    public func setup() {
        Directory.create("test_dir")
        File.create("test_dir/test_file.txt").close()
        File.writeTo("test_dir/test_file.txt", [97, 98, 100, 101])
        File.create("test_dir/tempfile").close()
        SymbolicLink.create("symlink", to: "test_dir/test_file.txt")
        Directory.create("tempdir1")
        Directory.create("tempdir2")
    }

    @TestCase
    func test_tarreader_01(): Unit {
        let bytebuffer_1 = ByteBuffer()
        TarReader(bytebuffer_1)
    }

    @TestCase
    func test_tarreader_02(): Unit {
        let bytebuffer_1 = ByteBuffer()
        let tarwriter = TarWriter(bytebuffer_1)
        for (path in filepaths) {
            tarwriter.write(Path(path), entryName: path)
        }
        tarwriter.flush()
        tarwriter.finish()
        let tarreader = TarReader(bytebuffer_1)
        let bytebuffer_2 = ByteBuffer()
        let _tarwriter = TarWriter(bytebuffer_2)
        for (entry in tarreader.iterator()) {
            _tarwriter.write(entry)
        }
        _tarwriter.flush()
        _tarwriter.finish()
        bytebuffer_1.seek(Begin(0))
        bytebuffer_2.seek(Begin(0))
        Tar.extract(fromStream: bytebuffer_1, destDir: "tempdir1", overwrite: false)
        Tar.extract(fromStream: bytebuffer_2, destDir: "tempdir2", overwrite: false)

        @Assert(compareFile("tempdir1/symlink", "tempdir2/symlink"))
        @Assert(compareFile("tempdir1/test_dir/test_file.txt", "tempdir2/test_dir/test_file.txt"))
        @Assert(compareFile("tempdir1/test_dir/tempfile", "tempdir2/test_dir/tempfile"))
    }
}