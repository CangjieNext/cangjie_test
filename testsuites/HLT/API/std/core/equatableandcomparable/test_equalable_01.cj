/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
@Test
class Test_equalable_01 {
    @TestCase
    func test_equalable_01(): Unit {
        let equaltest1 = A("cangjie")
        let equaltest2 = A("cangjie")
        let equaltest3 = A("cangjie1")

        @Expect(equaltest1 != equaltest2, false)
        @Expect(equaltest1 != equaltest3, true)
    }
}

class A <: Equatable<A> {
    A(let x: String) {}

    public operator func ==(rhs: A): Bool {
        this.x == rhs.x
    }
}
