/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output --sanitizer-coverage-trace-pc-guard --sanitizer-coverage-trace-compares
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --coverage-guided | compare %f
// ASSERT: scan Assert Failed

import std.random.*

var arr1 = Array<Int64>(10, repeat: 0)
let random0 = Random()

func prepareData() {
    for (index in 0..arr1.size) {
        arr1[index] = random0.nextInt64()
    }
}

@Test
@Configure[randomSeed: 1, generationSteps: 3000]
public class Test_Random_Coverage {
    @BeforeAll
    func setup() {
        prepareData()
    }

    @TestCase[x in random()]
    func test_array_int(x: Array<Int64>) {
        // clarification: 10 elements is too much for our current CGT algorithm, but
        // the referred case was about comparison with 0
        // the statement before is to check that 0 is properly generated even in the presence of
        // other checks
        if (x.size < 10) {
            return
        }
        @Assert(x[0] != arr1[0] || x[1] != arr1[1] || x[2] != arr1[2] || x[3] != arr1[3] 
        || x[4] != arr1[4] || x[5] != arr1[5] || x[6] != arr1[6] || x[7] != arr1[7] 
        || x[8] != arr1[8] || x[9] != arr1[9] || x[10] != arr1[10])
        @Assert(x[0] != 0)
    }
}
