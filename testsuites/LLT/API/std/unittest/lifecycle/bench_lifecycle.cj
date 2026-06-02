/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --bench --no-color 2>&1  | compare %f
// ASSERT: scan-begin ba
// ASSERT: scan-next be
// ASSERT: scan-next Starting the benchmark
// ASSERT: scan-next Warming up for
// ASSERT: scan-next XX
// ASSERT: scan-next Starting measurements
// ASSERT: scan-next Max batch
// ASSERT: scan-next 
// ASSERT: scan-after ae
// ASSERT: scan-next aa
import std.time.*

var printed = false

@Test
class FooTest2 {
    @BeforeAll
    func f1() {
        println("ba")
    }

    @BeforeEach
    func f2() {
        println("be")
    }

    @AfterEach
    func f3() {
        println("ae")
    }

    @AfterAll
    func f4() {
        println("aa")
    }

    @Bench
    @Configure[
        warmup: 1,
        minDuration: Duration.millisecond * 2
    ]
    func testSleep2(): Unit {
        if (!printed) {
            println("XX")
            printed = true
        }
    }
}
