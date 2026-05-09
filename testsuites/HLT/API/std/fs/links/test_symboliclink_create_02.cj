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
class Test_SymbolicLink {
    @TestCase
    func create_empty() {
        SymbolicLink.create("temp", to: "./tempfile")
        @Expect(exists("temp"))
        remove("temp")
    }

    @TestCase
    func create_illegal_01() {
        File.create("./tempfile").close()
        let e = @AssertThrows[FSException](SymbolicLink.create("tempfile", to: "./tempfile"))
        @Expect(e.message == "File exists." || e.message.contains("Failed to create symbolic link `tempfile` to `./tempfile` return -17"))
        remove("./tempfile")
    }

    @TestCase
    func create_illegal_02() {
        File.create("./tempfile").close()
        let e = @AssertThrows[IllegalArgumentException](SymbolicLink.create("temp", to: "./tempfile\0"))
        @Expect(e.message, "The input path 'to' value [46, 47, 116, 101, 109, 112, 102, 105, 108, 101, 0] contains null character.")
        remove("./tempfile")
    }

    @TestCase
    func create_illegal_03() {
        File.create("./tempfile").close()
        let e = @AssertThrows[IllegalArgumentException](SymbolicLink.create("", to: "./tempfile"))
        @Expect(e.message, "The input path 'link' is empty.")
        remove("./tempfile")
    }

    @TestCase
    func create_illegal_04() {
        File.create("./tempfile").close()
        let e = @AssertThrows[FSException](SymbolicLink.create("./dir/aa", to: "./tempfile"))
        @Expect(e.message == "No such file or directory." || e.message.contains("Failed to create symbolic link `./dir/aa` to `./tempfile` return -2"))
        remove("./tempfile")
    }

    @TestCase
    func create_illegal_05() {
        Directory.create("./a/b/c/d", recursive: true)
        SymbolicLink.create("temp", to: "./a/b/c/d")
        @Expect(exists("temp"))
        remove("temp")
        remove("./a", recursive: true)
    }

    @TestCase
    func create_path() {
        Directory.create("./a/b/c/d", recursive: true)
        @Assert(exists("./a/b/c/d"), true)
        Directory.create("./a0/b/c/d", recursive: true)
        @Assert(exists("./a0/b/c/d"), true)
        File.create("./a/b/c/d/file.txt").close()
        @Assert(exists("./a/b/c/d/file.txt"), true)
        SymbolicLink.create("./a0/b/c/d/temp", to: "./a/b/c/d/file.txt")
        @Expect(exists("./a0/b/c/d/temp"), true)
        remove("./a", recursive: true)
        remove("./a0", recursive: true)
    }

    @TestCase
    func create_move_origin() {
        Directory.create("./a/b/c/d", recursive: true)
        @Assert(exists("./a/b/c/d"), true)
        Directory.create("./a0/b/c/d", recursive: true)
        @Assert(exists("./a0/b/c/d"), true)
        File.create("./a/b/c/d/file.txt").close()
        @Assert(exists("./a/b/c/d/file.txt"), true)
        let data: Array<Byte> = [0, 1, 2, 3, 4]
        File.appendTo("./a/b/c/d/file.txt", data)
        SymbolicLink.create("./a0/b/c/d/temp", to: "./a/b/c/d/file.txt")
        @Expect(exists("./a0/b/c/d/temp"), true)
        rename("./a/b/c/d/file.txt", to: "./a/b/c/file.txt", overwrite: true)
        File.appendTo("./a/b/c/file.txt", data)
        @Expect(exists("./a0/b/c/d/temp"), true)
        let e = @AssertThrows[FSException](File.readFrom("./a0/b/c/d/temp"))
        @Expect(e.message.contains("Failed to open the file"))
        remove("./a", recursive: true)
        remove("./a0", recursive: true)
    }

    @TestCase
    func create_move_link() {
        Directory.create("./a/b/c/d", recursive: true)
        @Assert(exists("./a/b/c/d"), true)
        Directory.create("./a0/b/c/d", recursive: true)
        @Assert(exists("./a0/b/c/d"), true)
        File.create("./a/b/c/d/file.txt").close()
        @Assert(exists("./a/b/c/d/file.txt"), true)
        let data: Array<Byte> = [0, 1, 2, 3, 4]
        File.appendTo("./a/b/c/d/file.txt", data)
        SymbolicLink.create("./a0/b/c/d/temp", to: "./a/b/c/d/file.txt")
        @Expect(exists("./a0/b/c/d/temp"), true)
        rename("./a0/b/c/d/temp", to: "./a0/b/c/temp", overwrite: true)
        File.appendTo("./a/b/c/d/file.txt", data)
        @Expect(exists("./a0/b/c/d/temp"), false)
        @Expect(exists("./a0/b/c/temp"), true)
        let e = @AssertThrows[FSException](File.readFrom("./a0/b/c/temp"))
        @Expect(e.message.contains("Failed to open the file"))
        remove("./a", recursive: true)
        remove("./a0", recursive: true)
    }
}
