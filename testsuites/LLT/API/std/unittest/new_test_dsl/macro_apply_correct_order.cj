/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan REASON: After 80 generation steps
// ASSERT: scan with randomSeed = 10

@Test
@Configure[randomSeed: 1, generationSteps: 50, reductionSteps: 200]
@Configure[randomSeed: 1, generationSteps: 10, reductionSteps: 200]
class Test_Combinations {
    @TestCase[x in 0 .. 100, 
]
    @Configure[randomSeed: 5, generationSteps: 70, reductionSteps: 100]
    @Configure[randomSeed: 10, generationSteps: 80, reductionSteps: 100]
    func case3(x: Int64): Unit {
        @Expect(x != 79)
    }
}
