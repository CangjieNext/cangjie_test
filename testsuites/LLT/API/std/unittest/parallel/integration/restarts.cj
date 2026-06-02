/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --parallel=3nCores --no-color | compare %f
// ASSERT: scan-1 Test1.passing
// ASSERT: scan-1 Test1.crashing
// ASSERT: scan-1 top.infinite
// ASSERT: scan-1 Test2.passing
// ASSERT: scan-1 Test2.crashing
// ASSERT: scan-1 Test2.infinite
// ASSERT: scan-1 PASSED: 2
// ASSERT: scan-1 ERROR: 2
// ASSERT: scan-1 FAILED: 2

import std.unittest.*
import std.unittest.testmacro.*
import std.process.Process
import std.time.*

@Test
class Test1 {
    @TestCase
    func crashing(): Unit {
        println("Test1.crashing")
        Process.current.exit(42)
    }

    @TestCase
    func passing(): Unit {
        println("Test1.passing after crashed test case")
    }
}

@Test
@Timeout[2 * Duration.second]
func infinite(): Unit {
    print("top.infinite\n", flush: true)
    while (true) {}
}

@Test
@Timeout[2 * Duration.second]
@Parallel
class Test2 {
    @TestCase
    func infinite(): Unit {
        print("Test2.infinite\n", flush: true)
        while (true) {}
    }

    @TestCase
    func crashing(): Unit {
        print("Test2.crashing\n", flush: true)
        Process.current.exit(43)
    }

    @TestCase
    @Timeout[4 * Duration.second]
    func passing(): Unit {
        println("Test2.passing")
    }
}
