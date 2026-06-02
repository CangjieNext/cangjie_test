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

@When[os != "Windows"]
let str1: String = "No such file or directory"
@When[os == "Windows"]
let str1: String = "Failed to canonical"

@Test
class Test_SymbolicLink_ReadFrom {
    @TestCase
    func readfrom_movelink() {
        File.create("./tempfile0").close()
        @Assert(exists("./tempfile0"), true)
        Directory.create("./dir")
        @Assert(exists("./dir"), true)
        SymbolicLink.create("./tempfile1", to: "./tempfile0")
        SymbolicLink.create("./tempfile2", to: "./tempfile1")
        rename("tempfile1", to: "./dir/tempfile1")
        @Expect(exists("tempfile1"), false)
        @Expect(SymbolicLink.readFrom("tempfile2"), Path("tempfile1"))
        let e = @AssertThrows[FSException](SymbolicLink.readFrom("tempfile2", recursive: true))
        @Expect(e.message.contains(str1))
        remove("tempfile0")
        remove("./dir", recursive: true)
        remove("tempfile2")
    }

    @TestCase
    func readfrom_moveorigin() {
        File.create("./tempfile0").close()
        @Assert(exists("./tempfile0"), true)
        Directory.create("./dir")
        @Assert(exists("./dir"), true)
        SymbolicLink.create("./tempfile1", to: "./tempfile0")
        SymbolicLink.create("./tempfile2", to: "./tempfile1")
        rename("tempfile0", to: "./dir/tempfile0")
        @Expect(SymbolicLink.readFrom("tempfile2"), Path("tempfile1"))
        let e = @AssertThrows[FSException](SymbolicLink.readFrom("tempfile2", recursive: true))
        @Expect(e.message.contains(str1))
        remove("./dir", recursive: true)
        remove("tempfile1")
        remove("tempfile2")
    }

    @TestCase
    func readfrom_illegal_01() {
        let e = @AssertThrows[IllegalArgumentException](SymbolicLink.readFrom("", recursive: true))
        @Expect(e.message, "The input path is empty.")
    }

    @TestCase
    func readfrom_illegal_02() {
        let e = @AssertThrows[IllegalArgumentException](SymbolicLink.readFrom(Path("./a\0"), recursive: true))
        @Expect(e.message, "The input path value [46, 47, 97, 0] contains null character.")
    }
}
