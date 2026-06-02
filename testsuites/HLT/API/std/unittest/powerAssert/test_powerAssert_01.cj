/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-1: %run %run_opt %output %run_utest_opt %run_args

class Prepare {
    static let a = 1
    static func b() {
        0
    }
}

@Test
class Test_PowerAssert {
    func func00(a: String): String {
        a + a
    }

    func func01(a: Int64): Int64 {
        a * a
    }

    func func02(a: Int64): Int64 {
        a * a * a
    }

    @TestCase
    func test01() {
        @PowerAssert( 23 + 45 * 123, 124 * 3 % 1234)
    }

    @TestCase
    func test02() {
        println(true || false || true)
        println(true && true && false && false)
        @PowerAssert( true && true && false && false, true || false || true  )
    }

    @TestCase
    func test03() {
        @PowerAssert((1234 | 4) ,  (2 ^ 4))
    }

    @TestCase
    func test04() {
        @PowerAssert(Prepare.a ,  Prepare.b())
    }

    @TestCase
    func test05() {
        @PowerAssert(((func01(func01(func01(func01( func01(func01 (1)))))))), func02(5))
    }

    @TestCase
    func test05_1() {
        @PowerAssert(func00(func00(func00("a b "))), "a b ")
    }

    @TestCase
    func test06() {
        @PowerAssert("hello" is Int64, true)
    }

    @TestCase
    func test07() {
        let a = true
        @PowerAssert(!!!a)
    }
}
