/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --timeout-each=200millis 2>&1 | compare %f
// ASSERT: scan-not illegal running process
// ASSERT: scan-5 successful running process

/*
 * Test description:
 *      test --timeout-each=N(millis|s|m|h) for a class and a case,and inner macro have more priority
 * Test API:
 *      --timeout-each=N(millis|s|m|h)
 */

import std.process.*
import std.time.*
import std.sync.*

@Test
class Test_Timeout_01 {
    @TestCase
    func case01(): Unit {
        print("successful running process\n", flush: true)
    }

    @TestCase
    @Timeout[Duration.second]
    func case02(): Unit {
        sleep(Duration.second * 2)
        println("illegal running process")
    }

    @TestCase
    @Timeout[Duration.second]
    func case03(): Unit {
        sleep(Duration.second * 0.5)
        print("successful running process\n", flush: true)
        Process.current.exit(42)
        println("illegal running process")
    }

    @Bench
    @Timeout[Duration.second]
    func case04(): Unit {
        Process.current.exit(42)
        println("illegal running process")
    }
}

@Test
@Timeout[Duration.second]
class Test_Timeout_02 {
    @TestCase
    func case01(): Unit {
        sleep(Duration.second * 2)
        println("illegal running process")
    }

    @TestCase
    func case02(): Unit {
        sleep(Duration.second * 0.5)
        print("successful running process\n", flush: true)
        Process.current.exit(42)
        println("illegal running process")
    }

    @TestCase
    @Timeout[3 * Duration.second]
    func case03(): Unit {
        sleep(Duration.second * 2)
        print("successful running process\n", flush: true)
        sleep(Duration.second * 2)
        Process.current.exit(42)
        println("illegal running process")
    }

    @Bench
    func case04(): Unit {
        Process.current.exit(42)
        println("illegal running process")
    }
}

@Test
@Timeout[Duration.second]
func Test_Timeout_03(): Unit {
    sleep(Duration.second * 2)
    println("illegal running process")
}

@Test
@Timeout[Duration.second]
func Test_Timeout_04(): Unit {
    sleep(Duration.second * 0.5)
    print("successful running process\n", flush: true)
    Process.current.exit(42)
    println("illegal running process")
}
