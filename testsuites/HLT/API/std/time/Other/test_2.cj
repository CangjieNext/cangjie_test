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

import std.time.*
import std.math.*

@Test
class TestDuration {
    @TestCase
    func testCase00(): Unit {
        @Expect((Duration.nanosecond * Int64.Max).toString(), "106751d23h47m16s854ms775us807ns")
        @Expect((Duration.microsecond * (Int64.Max / 1000)).toString(), "106751d23h47m16s854ms775us")
        @Expect((Duration.millisecond * (Int64.Max / 1000 / 1000)).toString(), "106751d23h47m16s854ms")
        @Expect((Duration.second * (Int64.Max / 1000 / 1000 / 1000)).toString(), "106751d23h47m16s")
        @Expect((Duration.minute * (Int64.Max / 1000 / 1000 / 1000 / 60)).toString(), "106751d23h47m")
        @Expect((Duration.hour * (Int64.Max / 1000 / 1000 / 1000 / 60 / 60)).toString(), "106751d23h")
        @Expect((Duration.hour * (Int64.Max / 1000 / 1000 / 1000 / 60 / 60) - Duration.nanosecond * Int64.Max).toString(), "-47m16s854ms775us807ns")
    }
}
