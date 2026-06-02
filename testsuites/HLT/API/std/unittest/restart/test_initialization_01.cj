/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args | compare %f
// ASSERT: scan-1 BEFOREALL
// ASSERT: scan-1 AFTERALL
// ASSERT: scan-4 BEFOREEACH
// ASSERT: scan-4 AFTEREACH

/*
 * Test description:
 *      test @Timeout with beforeeach beforeall aftereach, afterall
 * Test API:
 *      @Configure[batchSize, minDuration, minBatches, warmup]
 */

import std.time.*

@Test
class Test_01 {
    public override func beforeAll(): Unit {
        println("BEFOREALL")
    }

    public override func beforeEach(): Unit {
        println("BEFOREEACH")
    }

    public override func afterAll(): Unit {
        println("AFTERALL")
    }

    public override func afterEach(): Unit {
        println("AFTEREACH")
    }

    @TestCase
    func case01(): Unit {
    }

    @TestCase
    @Timeout[Duration.second]
    func case02(): Unit {
    }

    @TestCase
    func case03(): Unit {
    }

    @TestCase
    func case04(): Unit {
    }
}
