/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.fs.*

@Test
class Test_RemoveIfExists {
    @AfterEach
    func teardown() {
        removeIfExists("tempfile")
    }

    @TestCase
    func remove_empty() {
        let e = @AssertThrows[IllegalArgumentException](removeIfExists(""))
        @Expect(e.message, "The input path is empty.")
    }

    @TestCase
    func remove_confuse() {
        let e = @AssertThrows[FSException](removeIfExists(".", recursive: false))
        @Expect(e.message.contains("Invalid argument") || e.message.contains("Access is denied.") || e.message.contains("The process cannot access the file because it is being used by another process"))
    }

    @TestCase
    func remove_illegal() {
        let e = @AssertThrows[IllegalArgumentException](removeIfExists(Path("./a\0")))
        println(e.message.toString())
        @Expect(e.message, "The input path value [46, 47, 97, 0] contains null character.")
    }

    @TestCase
    func remove_hardlink() {
        File.create("tempfile").close()
        @Assert(exists("tempfile"), true)
        HardLink.create("link.tempfile", to: "tempfile")
        removeIfExists("link.tempfile")
        @Expect(exists("link.tempfile"), false)
        @Expect(exists("tempfile"), true)
        remove("tempfile")
    }

    @TestCase
    func remove_symboliclink_01() {
        File.create("tempfile").close()
        @Assert(exists("tempfile"), true)
        SymbolicLink.create("link.tempfile", to: "tempfile")
        removeIfExists("link.tempfile")
        @Expect(exists("link.tempfile"), false)
        @Expect(exists("tempfile"), true)
        remove("tempfile")
    }

    @TestCase
    func remove_symboliclink_02() {
        File.create("tempfile").close()
        @Assert(exists("tempfile"), true)
        SymbolicLink.create("link.tempfile", to: "tempfile")
        removeIfExists("link.tempfile", recursive: true)
        @Expect(exists("link.tempfile"), false)
        @Expect(exists("tempfile"), true)
        remove("tempfile")
    }

    @TestCase
    func fakeremove() {
        File.create("testing_filename.aa....b.txt").close()
        @Assert(exists("testing_filename.aa....b.txt"), true)
        removeIfExists("testing_filename.aa...b.txt", recursive: true)
        removeIfExists("testing_filename.aa....b.tx")
        removeIfExists("testing_filenames.aa....b.txt", recursive: true)
        removeIfExists("../testing_filename.aa....b.txt")
        @Expect(exists("testing_filename.aa....b.txt"), true)
        removeIfExists("testing_filename.aa....b.txt")
        @Expect(exists("testing_filename.aa....b.txt"), false)
    }

    @TestCase
    func remove_nested_dir() {
        var s = "./"
        for (i in 0..20) {
            s += "a/"
        }
        Directory.create(Path(s), recursive: true)
        @Assert(exists(Path(s)), true)
        removeIfExists(Path(s), recursive: true)
        @Expect(exists(Path(s)), false)
    }

    @TestCase
    func remove_failed() {
        Directory.create("./a/b/c/d", recursive: true)
        @Assert(exists("./a/b/c/d"), true)
        let e = @AssertThrows[FSException](removeIfExists("./a/b/c"))
        @Expect(exists("./a/b/c/d"), true)
        removeIfExists("./a", recursive: true)
        @Expect(exists("./a/b/c/d"), false)
    }
}
