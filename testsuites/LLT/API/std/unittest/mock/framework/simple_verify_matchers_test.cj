/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

public class VerifyMatchers {
    func foo(s: String, i: Int64): Unit {}
    func bar(a: VerifyMatchers_Foo, b: VerifyMatchers_Foo): Unit {}
}

class VerifyMatchers_Foo {}

@Test
public class VerifyMatchersTest {
    private let vm = mock<VerifyMatchers>()

    @TestCase
    func testLiteralMatchers(): Unit {
        success {
            @On(vm.foo(_, _)).returns(())

            vm.foo("a", 3)
            vm.foo("a", 4)
            vm.foo("a", 4)
            vm.foo("a", 5)
            vm.foo("a", 5)
            vm.foo("b", 3)
            vm.foo("b", 5)

            Verify.that(@Called(vm.foo("a", _)).times(5))
            Verify.that(@Called(vm.foo("b", _)).times(2))
            Verify.that(@Called(vm.foo(_, 3)).times(2))
            Verify.that(@Called(vm.foo(_, 4)).times(2))
            Verify.that(@Called(vm.foo(_, 5)).times(3))
            Verify.that(@Called(vm.foo("a", 3)).once())
            Verify.that(@Called(vm.foo("b", 5)).once())
            Verify.that(@Called(vm.foo("b", 4)).times(0))
        }
    }

    @TestCase
    func testRefEqMatchers(): Unit {
        success {
            @On(vm.foo(_, _)).returns(()).anyTimes()

            vm.foo("a", 3)
            Verify.that(@Called(vm.foo(eq("a"), eq(3))).once())

            @On(vm.bar(_, _)).returns(()).anyTimes()
            let a = VerifyMatchers_Foo()
            let b = VerifyMatchers_Foo()
            let c = VerifyMatchers_Foo()

            vm.bar(a, b)
            vm.bar(a, b)
            vm.bar(a, c)
            vm.bar(c, b)

            Verify.that(@Called(vm.bar(_ , same(b))).times(3))
            Verify.that(@Called(vm.bar(same(a), _)).times(3))
            Verify.that(@Called(vm.bar(a, any())).times(3))
            Verify.that(@Called(vm.bar(same(a), same(b))).times(2))
            Verify.that(@Called(vm.bar(same(c), _)).times(1))
            Verify.that(@Called(vm.bar(same(b), _)).times(0))
        }
    }

    @TestCase
    func testThatMatchers(): Unit {
        success {
            @On(vm.foo(_, _)).returns(()).anyTimes()

            vm.foo("abc", 0)
            vm.foo("abc", 1)
            vm.foo("cba", 2)
            vm.foo("bca", 3)

            Verify.that(
                @Called(vm.foo(
                argThat { s: String => s.contains("ab") },
                 _
            ))
                    .times(2))
            Verify.that(
                @Called(vm.foo(
                argThat { s: String => s.contains("bc") }, 
                _
            ))
                    .times(3))
            Verify.that(
                @Called(vm.foo(
                _,
                argThat { i: Int64 => i > 0 } 
            )).times(
                    3))
            Verify.that(
                @Called(vm.foo(
                _,
                argThat { i: Int64 => i % 2 == 0 } 
            ))
                    .times(2))
            Verify.that(
                @Called(vm.foo(
                argThat { s: String => s == "abc" }, 
                argThat { i: Int64 => i % 2 == 0 } 
            ))
                    .times(1))
        }
    }
}
