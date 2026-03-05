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

func assert<T>(input: T): Int32 {
    return 0
}

@Test
class TestVariance {
    @TestCase
    func test_variance_nested_tuples() {
        let tuples: ((Father, Father), ((Child, Father), (Father, Father))) = ((ChildChild(), Child()), ((ChildChild(),
                    Father()), (ChildChild(), Child())))
        assert<((Father, Father), ((Child, Father), (Father, Father)))>(tuples)
        assert<((Father, Father), ((Father, Father), (Father, Father)))>(tuples)
    }
}
