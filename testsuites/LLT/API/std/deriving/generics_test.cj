/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.deriving.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class GenericTest {
    @TestCase
    func smokeClassTest() {
        @Expect(C(1) == C(1))
        @Expect(C(1) != C(2))

        @Expect(C(1) is Equatable<C<Int>>)
        @Expect(!(C(S()) is Equatable<C<S>>))

        @Expect(C(1).toString(), "C(value: 1)")
        @Expect(!(C(S()) is ToString))
    }

    @TestCase
    func smokeEnumTest() {
        @Expect(E.Single(1) == E.Single(1))
        @Expect(E.Single(2) != E.Single(1))
        @Expect(E<String>.Empty == E<String>.Empty)
        @Expect(E.Single(3).toString(), "E.Single(3)")

        @Expect(!(E.Single(S()) is ToString))
    }

    @TestCase
    func customGeneric() {
        @Expect(Custom<Int>().toString(), "Custom(x: 1)")
        @Expect(Custom<String>().toString(), "Custom(x: 1)")
        @Expect(Custom<S>().toString(), "Custom(x: 1)")
    }
}

struct S {}

@Derive[ToString, Equatable]
class C<T> {
    C(let value: T) {}
}

@Derive[ToString, Equatable]
enum E<T> {
    | Single(T)
    | Empty
}

@Derive[ToString where T <: Any]
struct Custom<T> {
    var x = 1
}
