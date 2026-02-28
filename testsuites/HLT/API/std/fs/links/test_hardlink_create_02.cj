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
class Test_HardLink {
    @TestCase
    func create_illegal_01() {
        let e = @AssertThrows[FSException](HardLink.create("temp", to: "./tempfile"))
        @Expect(e.message.contains("No such file or directory") || e.message.contains("Failed to create link"))
    }

    @TestCase
    func create_illegal_02() {
        File.create("./tempfile").close()
        let e = @AssertThrows[IllegalArgumentException](HardLink.create("temp", to: "./tempfile\0"))
        @Expect(e.message, "The input path 'to' value [46, 47, 116, 101, 109, 112, 102, 105, 108, 101, 0] contains null character.")
        remove("./tempfile")
    }

    @TestCase
    func create_illegal_03() {
        File.create("./tempfile").close()
        let e = @AssertThrows[IllegalArgumentException](HardLink.create("", to: "./tempfile"))
        @Expect(e.message, "The input path 'link' is empty.")
        remove("./tempfile")
    }

    @TestCase
    func create_illegal_04() {
        File.create("./tempfile").close()
        let e = @AssertThrows[FSException](HardLink.create("./dir/aa", to: "./tempfile"))
        @Expect(e.message.contains("No such file or directory") || e.message.contains("Failed to create link"))
        remove("./tempfile")
    }

    @TestCase
    func create_illegal_05() {
        Directory.create("./a/b/c/d", recursive: true)
        let e = @AssertThrows[FSException](HardLink.create("temp", to: "./a/b/c/d"))
        println(e.message)
        @Expect(e.message.contains("Operation not permitted") || e.message.contains("Failed to create link"))
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
        HardLink.create("./a0/b/c/d/temp", to: "./a/b/c/d/file.txt")
        @Expect(exists("./a0/b/c/d/temp"), true)
        remove("./a", recursive: true)
        remove("./a0", recursive: true)
    }
}
