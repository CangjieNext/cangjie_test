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
class Test_comparable_02 {
    @TestCase
    func test_comnparable_01(): Unit {
        let comparetest1 = A("cangjie")
        let comparetest2 = A("cangjie")
        let comparetest3 = A("cangjie1")
        @Expect(comparetest1 == comparetest2, true)
        @Expect(comparetest1 == comparetest3, false)
        @Expect(comparetest1 != comparetest3, true)
        @Expect(comparetest1 != comparetest2, false)
        @Expect(comparetest1 < comparetest3, true)
        @Expect(comparetest1 <= comparetest2, true)
        @Expect(comparetest3 > comparetest1, true)
        @Expect(comparetest2 >= comparetest1, true)
        @Expect(comparetest3 > comparetest2, true)
    }
}

class A <: Comparable<A> {
    A(let x: String) {}

    public func compare(that: A): Ordering {
        this.x.compare(that.x)
    }
}
