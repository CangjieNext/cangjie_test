/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-1: %run %run_opt %output %run_utest_opt %run_args --bench

import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*
import std.time.*

@Test
@Bench[x in 0 .. 10, 
 y in 0 .. 10: 2 
]
@Configure[
    randomSeed: 985,
    generationSteps: 2000,
    reductionSteps: 200,
    minDuration: Duration.millisecond
]
func case1(x: Int64, y: Int64): Unit {
    @Expect(x == y)
    sleep(Duration.millisecond)
}
