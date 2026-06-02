/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color | compare %f
// ASSERT: scan-4 foo2
// ASSERT: scan [ ERROR  ] CASE: foo1
// ASSERT: scan REASON: Test case body was never executed. Provided strategy has zero elements.

@Test
class FooTest {
    @TestCase[a in Array<Int64>()]
    func foo1(a: Int64): Unit {
        println("foo1 ${a}")
    }

    @TestCase[a in [ 1, 2, 3 ]]
    @Configure[generationSteps: 0]
    func foo2(a: Int64): Unit {
        println("foo2")
    }
}
