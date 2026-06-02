/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test enum Option<T>
 *          Test the correctness of the option.isNone() function.
 * Test API:
 *       public func isNone(): Bool
 */

@Test
class TestOptionIsNone {
    @TestCase
    func normalTest(): Unit {
        let a: ?String = None
        let b: ?String = "hello"

        @Expect(a.isNone())
        @Expect(!b.isNone())
    }

    @TestCase
    func expandTest(): Unit {
        let a: ?A = None
        let b: ?A = A(2023)

        @Expect(a.isNone())
        @Expect(!b.isNone())
    }
}

class A {
    public A(let a: Int64) {}
}
