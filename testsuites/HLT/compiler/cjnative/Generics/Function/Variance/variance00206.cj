/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2 EXCLUDE
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

open class Father {
    init() {}

    public open func foo() {
        0
    }
}

open class Child <: Father {
    public open override func foo() {
        1
    }
}

class ChildChild <: Child {
    public override func foo() {
        2
    }
}

func f1(a: Father, b: Child): (Child, ChildChild) {
    return (Child(), ChildChild())
}

@Test
class TestVariance {
    @TestCase
    func test_variance_nested_classfunc() {
        let foo1: ((ChildChild, ChildChild) -> (Father, Father), Father) = (f1, ChildChild())
        let (a, b) = foo1
        @Expect(b.foo(), 2)
        let (a0, b0) = a(ChildChild(), ChildChild())
        @Expect(a0.foo(), 1)
        @Expect(b0.foo(), 2)
    }
}
