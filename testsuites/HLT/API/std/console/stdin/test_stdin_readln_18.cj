/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: stdin_read.txt
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// (not iOS) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args < stdin_read.txt

import std.collection.*
import std.sync.*
import std.console.*

@Test
class Test_stdin_read_09 {
    @TestCase
    func test_stdin_read(): Unit {
        let string = StringBuilder(r'a', 10165).toString()
        var c = Console.stdIn.readln()
        @Expect(c.getOrThrow(), string)
    }
}
