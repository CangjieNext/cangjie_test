/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --bench 2>&1 | compare %f
// ASSERT: scan percentiles

import std.random.*
import std.runtime.*

let random = Random()

@Test
class Test_Bench_01 {
    let arr = [1, 2, 3, 4]

    @Bench
    func case01(): Unit {
        blackBox(arr.toString())
    }

    @Bench
    func case02(): Unit {
        blackBox(arr[0])
    }

    @Bench
    func case03(): Unit {
        if (random.nextBool()) {
            blackBox(arr[0])
        } else {
            blackBox(arr.toString())
        }
    }
}
