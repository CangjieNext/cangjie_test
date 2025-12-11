/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import stdx.compress.tar.*

@Test
class test_GnuTarEntry {
    @BeforeAll
    public func setup() {
        File.create("test_file.txt").close()
        Directory.create("test_dir")
        File.create("test_dir/test_file.txt").close()
        File.writeTo("test_dir/test_file.txt", [90])
        SymbolicLink.create("symlink", to: "test_file.txt")
    }

    @TestCase
    func test_init_01(): Unit {
        let _entry = GnuTarEntry(Path("test_file.txt"))
        @Assert(_entry.stream.isSome())
        @Assert(_entry.name, "test_file.txt")
        println(_entry.uid)
        println(_entry.gid)
        @Assert(_entry.size, 0)
        println(_entry.modificationTime.toString())
        match (_entry.entryType) {
            case TarEntryType.RegularFile => ()
            case _ => @Assert(false)
        }
        println(_entry.userName)
        println(_entry.groupName)
        println(_entry.deviceMajor)
        println(_entry.deviceMinor)
        println(_entry.accessTime)
        println(_entry.changeTime)
    }

    @TestCase
    @Skip
    func test_init_02(): Unit {
        let _entry = GnuTarEntry(Path("test_dir"))
        @Expect(_entry.stream.isSome())
        @Assert(_entry.name, "test_dir/")
        println(_entry.uid)
        println(_entry.gid)
        @Assert(_entry.size, 0)
        println(_entry.modificationTime.toString())
        match (_entry.entryType) {
            case TarEntryType.Directory => ()
            case _ => @Assert(false)
        }
        println(_entry.userName)
        println(_entry.groupName)
        println(_entry.deviceMajor)
        println(_entry.deviceMinor)
        println(_entry.accessTime)
        println(_entry.changeTime)
    }

    @TestCase
    func test_init_03(): Unit {
        let _entry = GnuTarEntry(Path("symlink"))
        @Assert(_entry.name, "symlink")
        println(_entry.uid)
        println(_entry.gid)
        @Assert(_entry.size, 0)
        println(_entry.modificationTime.toString())
        match (_entry.entryType) {
            case TarEntryType.Symlink => ()
            case _ => @Assert(false)
        }
        println(_entry.userName)
        println(_entry.groupName)
        println(_entry.deviceMajor)
        println(_entry.deviceMinor)
        println(_entry.accessTime)
        println(_entry.changeTime)
    }
}