/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.fs.*

@Test
class Test_SymbolicLink {
    @TestCase
    func create_01() {
        File.create("./tempfile").close()
        @Assert(exists("./tempfile"), true)
        let data: Array<Byte> = [0, 1, 2, 3, 4]
        File.appendTo("./tempfile", data)
        SymbolicLink.create(".temp", to: "./tempfile")
        @Expect(exists(".temp"), true)
        @Expect(SymbolicLink.readFrom(".temp"), Path("./tempfile"))
        remove("./tempfile")
        remove(".temp")
    }
}
