/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.fs.*

@Test
class Test_SymbolicLink_ReadFrom {
    @TestCase
    func readfrom_01() {
        File.create("./tempfile0").close()
        @Assert(exists("./tempfile0"), true)
        SymbolicLink.create("./tempfile1", to: "./tempfile0")
        SymbolicLink.create("./tempfile2", to: "./tempfile1")
        @Expect(SymbolicLink.readFrom(Path("tempfile1")), Path("tempfile0"))
        @Expect(SymbolicLink.readFrom("tempfile2"), Path("tempfile1"))
        @Expect(SymbolicLink.readFrom("tempfile2", recursive: true), canonicalize(Path("tempfile0")))
        remove("tempfile0")
        remove("tempfile1")
        remove("tempfile2")
    }
}
