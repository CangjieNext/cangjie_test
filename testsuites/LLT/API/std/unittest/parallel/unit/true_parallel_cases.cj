/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --parallel=5 --no-color | compare %f
// ASSERT: scan-1 11,21,31,12,22,32

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@Test
@Parallel
class Test {
    @TestCase
    func case01(): Unit {
        print("11,", flush: true)
        sleep(Duration.second * 6)
        print("12,", flush: true)
    }

    @TestCase
    func case02(): Unit {
        sleep(Duration.second * 2)
        print("21,", flush: true)
        sleep(Duration.second * 8)
        print("22,", flush: true)
    }

    @TestCase
    func case03(): Unit {
        sleep(Duration.second * 4)
        print("31,", flush: true)
        sleep(Duration.second * 10)
        print("32\n", flush: true)
    }
}
