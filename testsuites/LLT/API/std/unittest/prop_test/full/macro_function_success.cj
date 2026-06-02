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

@Test[data in random()]
@Configure[randomSeed: 1]
func fooTest(data: Array<Int64>): Unit {
    if (data.size < 2) {
        return
    }
    if (data[0] % 4 == 0) {
        // always true, will probably never be optimized
        @Assert(data[0] % 2 == 0)
    }
}
