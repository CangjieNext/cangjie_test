/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// RUN-EXEC-PIPE: %run %run_opt %output --bench %run_args 2>&1 | compare %f
// ASSERT: scan-not 0 ms

import std.unittest.*
import std.unittest.testmacro.*

var str = "123"

@Test
class TestBench {
    @Bench[10]
    @TestCase
    func case01(): Unit {
        sleep(Duration.nanosecond * 1)
        @Assert(str, "123")
    }
}
