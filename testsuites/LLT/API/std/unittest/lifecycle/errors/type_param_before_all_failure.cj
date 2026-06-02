/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color | compare %f
// ASSERT: scan-3 [ ERROR  ] Before all step failed. Tests not run.
// ASSERT: scan-3 MESSAGE FROM EXCEPTION

import std.unittest.*
import std.unittest.testmacro.*

@Test
@Types[T in<Int32, Int64, String>]
class TPTest<T> {
    @BeforeAll
    func before() {
        throw Exception("MESSAGE FROM EXCEPTION")
    }

    @TestCase
    func doTest() {}
}
