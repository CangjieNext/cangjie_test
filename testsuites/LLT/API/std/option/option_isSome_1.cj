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
 *          Test the correctness of the option.isSome() function.
 * Test API:
 *       public func isSome(): Bool
 */

@Test
class TestOptionIsSome {
    @TestCase
    func normalTest(): Unit {
        let a: ?String = None
        let b: ?String = "hello"

        @Expect(!a.isSome())
        @Expect(b.isSome())
    }

    @TestCase
    func expandTest(): Unit {
        let a: ?A = None
        let b: ?A = A(2023)

        @Expect(!a.isSome())
        @Expect(b.isSome())
    }
}

class A {
    public A(let a: Int64) {}
}
