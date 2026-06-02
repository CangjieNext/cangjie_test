/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --bench --death-aware 2>&1 | compare %f
// ASSERT: scan-not illegal running process

/*
 * Test description:
 *      test --death-aware option for all kinds testing
 * Test API:
 *      --death-aware
 */

import std.process.*

@Test
class Test_01 {
    @TestCase
    func case01(): Unit {
        Process.current.exit(42)
        println("illegal running process")
    }

    @TestCase
    func case02(): Unit {
        Process.current.exit(42)
        println("illegal running process")
    }

    @Bench
    func case03(): Unit {
        Process.current.exit(42)
        println("illegal running process")
    }

    @TestCase
    func case04(): Unit {
        print("successful running process\n", flush: true)
    }
}

@Test
class Test_02 {
    @TestCase
    func case01(): Unit {
        Process.current.exit(42)
        println("illegal running process")
    }

    @TestCase
    func case02(): Unit {
        Process.current.terminate(force: true)
        println("illegal running process")
    }

    @Bench
    func case03(): Unit {
        Process.current.terminate(force: true)
        println("illegal running process")
    }

    @TestCase
    func case04(): Unit {
        print("successful running process\n", flush: true)
    }
}

@Test
func Test_03(): Unit {
    print("successful running process\n", flush: true)
}

@Test
func Test_04(): Unit {
    Process.current.terminate(force: true)
    println("illegal running process")
}

@Test
func Test_05(): Unit {
    print("successful running process\n", flush: true)
}

@Test
func Test_06(): Unit {
    Process.current.terminate(force: true)
    println("illegal running process")
}
