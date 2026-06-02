/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.io.*
import std.fs.*
import std.env.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

@Test
class File_readFrom_03 {
    @TestCase
    func testCase0(): Unit {
        let fileName = "./readFrom_no_exit_12.txt"
        let filePath = getWorkingDirectory().join(fileName)
        let e = @AssertThrows[FSException](File.readFrom(fileName))
        @Assert(e.toString(), "FSException: The file `${filePath}` does not exist or permission denied!")
    }
}
