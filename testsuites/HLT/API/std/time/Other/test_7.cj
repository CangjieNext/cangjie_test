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

import std.time.*
import std.math.*

@Test
class Test_7 {
    @TestCase
    func testCase0(): Unit {
        @Expect(Month.of(1) + 1, Month.February)
        @Expect(Month.of(1) + (-1), Month.December)
        @Expect(Month.of(1) - (-1), Month.February)
        @Expect(Month.of(1) - 1, Month.December)
    }
}
