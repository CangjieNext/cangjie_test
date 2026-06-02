/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 
@Test
class EquatableTest {
    @TestCase
    func test_defaultImpl(): Unit {
        let a1 = A(1)
        let a1_1 = A(1)
        let a2 = A(2)

        @Expect(a1 != a1_1, false)
        @Expect(a1 != a2, true)
    }
}

class A <: Equatable<A> {
    A(let x: Int64) {}

    public operator func ==(rhs: A): Bool {
        this.x == rhs.x
    }
}
