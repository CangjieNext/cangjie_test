/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

// Test for inline functino 'DateTime.of' will be collected and no linkage error
@Test
class Test_since {
    @TestCase
    func test_since_03(): Unit {
        DateTime.of(year: -999999999, month: January, dayOfMonth: 1, hour: 9, minute: 0, second: 0, nanosecond: 0)
    }
}
