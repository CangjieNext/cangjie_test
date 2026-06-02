/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
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

func assert<T>(input: T): Int32 {
    return 0
}

func f1(a: (Father, Child)): (Child, ChildChild) {
    return (Child(), ChildChild())
}

func f2(a: Father, b: Child): (Child, ChildChild) {
    return (Child(), ChildChild())
}

@Test
class TestVariance {
    @TestCase
    func test_variance_nested_funcs() {
        let funcs: (((ChildChild, ChildChild)) -> (Father, Father), (ChildChild, ChildChild) -> (Father, Father)) = (f1,
            f2)
        let (foo1, foo2) = funcs
        assert<((ChildChild, ChildChild)) -> (Father, Father)>(foo1)
        assert<(ChildChild, ChildChild) -> (Father, Father)>(foo2)
    }
}
