/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --parallel=11 --no-color | compare %f
// ASSERT: scan-1 print from 11
// ASSERT: scan-1 print from 21
// ASSERT: scan-1 12,22,standalone,13

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@Test
class Tests1 {
    @TestCase
    func case11(): Unit {
        print("print from 11\n", flush: true)
    }

    @TestCase
    func case12(): Unit {
        sleep(2 * Duration.second)
        print("12,", flush: true)
    }

    @TestCase
    func case13(): Unit {
        sleep(8 * Duration.second)
        print("13\n", flush: true)
    }
}

@Test
func standalone(): Unit {
    sleep(6 * Duration.second)
    print("standalone,", flush: true)
}

@Test
class Tests2 {
    @TestCase
    func case21(): Unit {
        print("print from 21\n", flush: true)
    }

    @TestCase
    func case22(): Unit {
        sleep(4 * Duration.second)
        print("22,", flush: true)
    }
}
