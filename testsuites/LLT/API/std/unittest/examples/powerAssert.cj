/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-1: %run %run_opt %output %run_utest_opt

func foo(x: Int64, y!: String = "foo") {
    y.size / x
}

func bar(_: Int64) {
    33
}

@Test
class TestA {
    @TestCase
    func case1(): Unit {
        let s = "123"
        let a = 1
        @PowerAssert(foo(10, y: "test" + s) == foo(s.size, y: s) + bar(a))
    }
}
// case from unittest_lib.md, if it's updated, pls update unittest_lib.md as well.
