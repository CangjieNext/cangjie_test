/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_07_a08_01

  @Level:         1

  @Assertion: 9.7(8) If the type arguments are provided during function invoking, that is, the function invoking 
              format is f<TA>(a), the f is a candidate when:

              The number of type parameters of f is the same with the type argument TA, and TA satisfy the generic
              constraints of the f, and the parameter list of f is applicable with respect to a.

  @Description: Check that generic function become an overload resolution candidate in f<TA>(a) function invoking
                format when:
                    1. Number of type parameters of f is the same to TA
                    2. TA satisfies generic constraint of the f
                    3. Parameter list of f is applicable with respect to a.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

open class A {}
open class B <: A {}

open class C {}
open class D <: C {}

open class E {}

func foo<T1, T2>(x1: T1, x2: T2) where T1 <: A, T2 <: C {
    return 1
}

func foo(x1 : E, x2: E) {
    return 2
}

func foo(x1: E) {
    return 3
}

func bar<T>(x1: T, x2: T) where T <: A {
    return 4
}

func bar(x1: A, x2: B) {
    return 5
}

main() {
    // 1. Number of type parameters is the same to TA.
    // 2. TA satisfies generic contraints.
    // 3. Parameter list is applicable with respect to calling arguments.
    //
    // Then generic function participates in overload resolution.
    Assert.equals(1, foo(B(), D()))

    // 1. Number of type parameters is NOT the same to TA.
    //
    // Generic function does NOT participate in overload resolution.
    Assert.equals(3, foo(E()))

    // 2. TA does NOT satisfies generic constraints.
    //
    // Generic function does NOT participate in overload resolution.
    Assert.equals(2, foo(E(), E()))

    // 3. Parameter list is not applicable with respect to calling arguments.
    //
    // Generic function does NOT participate in overload resolution.
    Assert.equals(5, bar(A(), B()))
}

