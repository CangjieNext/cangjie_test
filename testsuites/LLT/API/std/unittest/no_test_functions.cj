/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color | compare %f
// ASSERT: scan TCS: Test_Combination_01, No test functions found

@Test
class Test_Combination_01 {
    public override func beforeAll(): Unit {
        throw Exception("BEFOREALL")
    }

    public override func beforeEach(): Unit {
        throw Exception("BEFOREEACH")
    }

    public override func afterAll(): Unit {
        throw Exception("AFTERALL")
    }

    public override func afterEach(): Unit {
        throw Exception("AFTEREACH")
    }
}
