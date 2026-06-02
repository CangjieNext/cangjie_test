/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --parallel=4 | compare %f
// ASSERT: scan-3 beforeAll
// ASSERT: scan-3 afterAll
// ASSERT: scan-3 beforeEach
// ASSERT: scan-3 afterEach

/*
 * Test description:
 *      test if @Parallel modify a case and a class
 * Test API:
 *      @Parallel, --parallel=NUMBER|nCores|NUMBERnCores
 */

import std.time.*
import std.sync.*

@Test
@Parallel
class Test_Parallel_01 {
    public override func beforeAll(): Unit {
        println("beforeAll")
    }

    public override func beforeEach(): Unit {
        println("beforeEach")
    }

    public override func afterAll(): Unit {
        println("afterAll")
    }

    public override func afterEach(): Unit {
        println("afterEach")
    }

    @TestCase
    func case01(): Unit {
        sleep(Duration.second * 2)
    }

    @TestCase
    func case02(): Unit {
        sleep(Duration.second * 2)
    }

    @TestCase
    func case03(): Unit {
        sleep(Duration.second * 2)
    }
}
