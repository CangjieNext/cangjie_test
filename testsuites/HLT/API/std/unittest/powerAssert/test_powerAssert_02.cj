/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color | compare %f
// ASSERT: scan (func00(func01(60), func02(3)) == func02(9200))
// ASSERT: scan (func00(func01(10), foo()) == func02(5))
// ASSERT: scan [Exception]

@Test
class Test_PowerAssert {
    @TestCase
    func test01() {
        let a = 1
        let b = 1
        @PowerAssert(a, b)
    }

    @TestCase
    func test02() {
        @PowerAssert(false, false)
    }

    func func00(a: Int64, b: Int64): Int64 {
        a + b
    }

    func func01(a: Int64): Int64 {
        a * a
    }

    func func02(a: Int64): Int64 {
        a * a * a
    }

    @TestCase
    func test03() {
        @PowerAssert(func00( func01(60 )
        ,
        func02( 3))  ==  func02(9200))
    }

    @TestCase
    func test04() {
        let a = 5 |> {
            a: Int64 =>
            let b = a * a;
            b
        }
        @PowerAssert(a == 26)
    }

    // @TestCase
    // func test05() {
    //     @PowerAssert((5 |> { a: Int64 =>
    //                 let b = a * a;
    //                 b
    //             }) == 26)
    // }

    func foo(): Int64 {
        throw Exception("throw Exception")
        0
    }

    @TestCase
    func test06() {
        @PowerAssert(func00(func01(10), foo()), func02(5))
    }

    @TestCase
    func test07() {
        @PowerAssert("hello" + { => "a";
                "another hello"
                }() + "a", "")
    }

    @TestCase
    func test08() {
        let a = "Hello bob, nice to meet you today, 😀  😀    😀！"
        let b = "Hello 小王, 🆒。"
        @PowerAssert(a == b)
    }
}
