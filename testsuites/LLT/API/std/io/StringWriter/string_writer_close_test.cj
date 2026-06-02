/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../data
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.io.*
import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestStringReader {
    @TestCase
    func test_stringWriter_close(): Unit {
        var file = File.create("./data/test1.txt")
        var sw = StringWriter(file)
        sw.write("abc")
        sw.close()
        @Expect(sw.isClosed(), true)
        remove("./data/test1.txt")
    }
}
