/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.database.sql.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestConnectionState {
    @TestCase
    func ConnectionStateTest(): Unit {
        @Expect(Broken == Broken, true)
        @Expect(Closed == Closed, true)
        @Expect(Connecting == Connecting, true)
        @Expect(Connected == Connected, true)

        @Expect(Broken != Closed, true)
        @Expect(Broken != Connecting, true)
        @Expect(Broken != Connected, true)
        @Expect(Closed != Connecting, true)
        @Expect(Closed != Connected, true)
        @Expect(Connecting != Connected, true)
        @Expect(Broken != Broken, false)
        @Expect(Closed != Closed, false)
        @Expect(Connecting != Connecting, false)
        @Expect(Connected != Connected, false)
    }
}
