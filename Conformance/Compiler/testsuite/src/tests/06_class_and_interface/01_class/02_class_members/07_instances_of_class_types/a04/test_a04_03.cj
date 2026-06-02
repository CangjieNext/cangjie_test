/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_07_a04_03

  @Level:         1

  @Assertion: 6.1.2.7(4)
              Using ClassName<Type1, Type2, ... , TypeK>(arguments) for defining instances of generic classes.
              The only difference from defining an instance of a non-generic class is that type variables need to be
              instanced for generic classes, i.e., ‘Type1’ to ‘TypeN’ should be given or be inferred.

  @Description: Check that instances of generic classes can be created without
                explicit instantiation of type parameters if they can be inferred

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006294

*/

import utils.assert.Assert

class T {}

// The type parameter can be inferred from the only constructor's argument
class A<T> {
    init(x: T) {}
}

// Both type parameters can be inferred from the only constructor's arguments
class B<T1, T2> {
    init(x: T1, y: T2) {}
}

// One type parameter can be inferred from the only constructor's arument, another has only one possible type
class C<T1, T2> where T2 <: T {
    init(x: T1) {}
}

// Both type parameters can have only one possible type
class D<T1, T2> where T1 <: T, T2 <: T {
    init() {}
}

// The type parameter can be inferred from the argument of one of the constructors
class E<T> {
    init(x: Int64) {}
    init(x: T) {}
}

main() {
    let case1 = A(1)
    Assert.isTrue(case1 is A<Int64>)

    let case2 = A(r'1')
    Assert.isTrue(case2 is A<Rune>)

    let case3 = A((0.12313, true))
    Assert.isTrue(case3 is A<(Float64, Bool)>)

    let case4 = A({ => ""})
    Assert.isTrue(case4 is A<()->String>)

    let case5 = B("", r'f')
    Assert.isTrue(case5 is B<String, Rune>)

    let case6 = B((r'1', r'2'), (false, true))
    Assert.isTrue(case6 is B<(Rune, Rune), (Bool, Bool)>)

    let case7 = B(.01, .01)
    Assert.isTrue(case7 is B<Float64, Float64>)

    let case8 = B((), 1 * 5)
    Assert.isTrue(case8 is B<Unit, Int64>)

    let case9 = C("")
    Assert.isTrue(case9 is C<String, T>)

    let case10 = C([0])
    Assert.isTrue(case10 is C<Array<Int64>, T>)

    let case11 = D()
    Assert.isTrue(case11 is D<T, T>)

    let case13 = E("")
    Assert.isTrue(case13 is E<String>)

    let case14 = E({x: Int64 => x + 1})
    Assert.isTrue(case14 is E<(Int64) -> Int64>)
}