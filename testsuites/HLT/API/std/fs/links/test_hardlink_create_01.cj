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
class Test_HardLink {
    @TestCase
    func create_01() {
        File.create("./tempfile").close()
        @Assert(exists("./tempfile"), true)
        let data: Array<Byte> = [0, 1, 2, 3, 4]
        File.appendTo("./tempfile", data)
        HardLink.create(".temp", to: "./tempfile")
        @Expect(exists(".temp"), true)
        remove("./tempfile")
        @Expect(File.readFrom(".temp"), data)
        remove(".temp")
    }

    @TestCase
    func create_02() {
        File.create("./tempfile").close()
        @Assert(exists("./tempfile"), true)
        let data: Array<Byte> = [0, 1, 2, 3, 4]
        File.appendTo("./tempfile", data)
        HardLink.create(".temp", to: "./tempfile")
        @Expect(exists(".temp"), true)
        File.appendTo("./tempfile", data)
        let data0: Array<Byte> = [0, 1, 2, 3, 4, 0, 1, 2, 3, 4]
        @Expect(File.readFrom(".temp"), data0)
        remove("./tempfile")
        remove(".temp")
    }
}
