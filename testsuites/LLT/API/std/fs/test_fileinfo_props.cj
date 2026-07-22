/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class FileInfoPropsTest {
    @TestCase
    func test_fileinfo_name(): Unit {
        let path = "/tmp/cj_test_fileinfo_name.txt"
        File.create(path).close()
        let info = FileInfo(path)
        @Expect(info.name == "cj_test_fileinfo_name.txt")
        remove(path)
    }

    @TestCase
    func test_fileinfo_creation_time(): Unit {
        let path = "/tmp/cj_test_fileinfo_ct.txt"
        File.create(path).close()
        let info = FileInfo(path)
        let t = info.creationTime
        @Expect(t.year > 2020)
        remove(path)
    }

    @TestCase
    func test_fileinfo_last_access_time(): Unit {
        let path = "/tmp/cj_test_fileinfo_at.txt"
        File.create(path).close()
        let info = FileInfo(path)
        let t = info.lastAccessTime
        @Expect(t.year > 2020)
        remove(path)
    }

    @TestCase
    func test_fileinfo_last_mod_time(): Unit {
        let path = "/tmp/cj_test_fileinfo_mt.txt"
        File.create(path).close()
        let info = FileInfo(path)
        let t = info.lastModificationTime
        @Expect(t.year > 2020)
        remove(path)
    }

    @TestCase
    func test_fileinfo_is_hidden(): Unit {
        let path = "/tmp/.cj_test_hidden"
        File.create(path).close()
        let info = FileInfo(path)
        @Expect(info.isHidden())
        remove(path)
    }

    @TestCase
    func test_fileinfo_not_hidden(): Unit {
        let path = "/tmp/cj_test_not_hidden.txt"
        File.create(path).close()
        let info = FileInfo(path)
        @Expect(!info.isHidden())
        remove(path)
    }

    @TestCase
    func test_fileinfo_equals(): Unit {
        let path = "/tmp/cj_test_fileinfo_eq.txt"
        File.create(path).close()
        let info1 = FileInfo(path)
        let info2 = FileInfo(path)
        @Expect(info1 == info2)
        remove(path)
    }

    @TestCase
    func test_fileinfo_parent_dir(): Unit {
        let path = "/tmp/cj_test_fileinfo_parent.txt"
        File.create(path).close()
        let info = FileInfo(path)
        match (info.parentDirectory) {
            case Some(parent) =>
                @Expect(parent.name == "tmp")
            case None =>
                @Assert(false)
        }
        remove(path)
    }

    @TestCase
    func test_fileinfo_parent_root(): Unit {
        let info = FileInfo("/")
        match (info.parentDirectory) {
            case Some(_) =>
                @Assert(false)
            case None =>
                @Assert(true)
        }
    }

    @TestCase
    func test_openmode_tostring(): Unit {
        @Expect(OpenMode.Read.toString() == "Read")
        @Expect(OpenMode.Write.toString() == "Write")
        @Expect(OpenMode.Append.toString() == "Append")
        @Expect(OpenMode.ReadWrite.toString() == "ReadWrite")
    }

    @TestCase
    func test_openmode_equals(): Unit {
        @Expect(OpenMode.Read == OpenMode.Read)
        @Expect(OpenMode.Write == OpenMode.Write)
        @Expect(OpenMode.Append == OpenMode.Append)
        @Expect(OpenMode.ReadWrite == OpenMode.ReadWrite)
        @Expect(OpenMode.Read != OpenMode.Write)
        @Expect(OpenMode.Write != OpenMode.Append)
        @Expect(OpenMode.Append != OpenMode.ReadWrite)
    }

    @TestCase
    func test_file_descriptor(): Unit {
        let path = "/tmp/cj_test_fd.txt"
        let f = File.create(path)
        let fd = f.fileDescriptor
        @Expect(fd.fileHandle >= 0)
        f.close()
        remove(path)
    }
}
