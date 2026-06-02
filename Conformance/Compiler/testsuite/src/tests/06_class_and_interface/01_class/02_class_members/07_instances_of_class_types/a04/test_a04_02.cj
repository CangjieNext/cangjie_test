/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_07_a04_02

  @Level:         1

  @Assertion: 6.1.2.7(4)
              Using ClassName<Type1, Type2, ... , TypeK>(arguments) for defining instances of generic classes.
              The only difference from defining an instance of a non-generic class is that type variables need to be
              instanced for generic classes, i.e., ‘Type1’ to ‘TypeN’ should be given or be inferred.

  @Description: Check that when creating an instance of a generic class with multiple constructors,
                the constructor that is geting called is chosen according to the rules
                of invoking overloaded functions

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006290, 0006291

*/

import utils.assert.Assert

open class Top {}
open class Parent <: Top {}
class Child <: Parent {}

var init_id = -1

class Test<T1, T2> {
    init() {
        init_id = 1
    }

    init(x: Int64) {
        init_id = 2
    }

    init(x: Int64, y: Int64) {
        init_id = 3
    }

    init(x: Int64, y: Int32) {
        init_id = 4
    }

    init(x!: Parent) {
        init_id = 5
    }

    init(x!: Child) {
        init_id = 6
    }

    init(x: Parent, y: Parent) {
        init_id = 7
    }

    init(x: Child, y: Child) {
        init_id = 8
    }

    init(x: Parent, y: Child, z!: Bool = false) {
        init_id = 9
    }

    init(x!: Parent, y!: Parent, z!: Parent) {
        init_id = 10
    }

    init(x: (Parent) -> Unit) {
        init_id = 11
    }

    init(x: (Child) -> Unit) {
        init_id = 12
    }

    init(x: (Parent) -> Unit, y: (Parent) -> Unit, z!: Bool = true) {
        init_id = 13
    }

    init(x: (Parent) -> Unit, y: (Child) -> Unit) {
        init_id = 14
    }

    init(x: (Child) -> Unit, y: (Child) -> Unit, z: (Child) -> Unit) {
        init_id = 15
    }

    init(x: (Child) -> Unit, y: Parent) {
        init_id = 16
    }

    init(x: (Parent) -> Unit, y: Child) {
        init_id = 17
    }

    init(x: T1) {
        init_id = 18
    }

    init(x: T1, y: T2) {
        init_id = 19
    }

    init(x: T1, y: T1, z: T1) {
        init_id = 20
    }

    init(x!: (T1) -> Unit, y!: (T2) -> Unit) {
        init_id = 21
    }
}

main() {
    Test<Bool, Bool>()
    Assert.equals(1, init_id)

    Test<String, Rune>(10)
    Assert.equals(2, init_id)

    Test<Float64, Float16>(10, 11)
    Assert.equals(3, init_id)

    Test<Float64, Float16>(10, 11i32)
    Assert.equals(4, init_id)

    Test<Top, Top>(x: Parent())
    Assert.equals(5, init_id)

    Test<Top, Top>(x: Child())
    Assert.equals(6, init_id)

    Test<Top, Top>(Child(), Parent())
    Assert.equals(7, init_id)

    Test<Top, Top>(Child(), Child())
    Assert.equals(8, init_id)

    Test<Top, Top>(Parent(), Child())
    Assert.equals(9, init_id)

    Test<Top, Top>(x: Child(), y: Child(), z: Child())
    Assert.equals(10, init_id)

    func l0(x: Top) {}
    func l1(x: Parent) {}
    func l2(x: Child) {}
    Test<Top, Top>(l1)
    Assert.equals(11, init_id)

    // Here we have not only overloading of constructors
    // But also overloading of arguments
    // So first, the closest matching rule chooses between (Parent) -> Unit and (Child) -> Unit
    // The signature that will be chosen is (Parent) -> Unit since it's the most derived
    // After that the only of two f's that can be passed as the argument is f(x: Parent)
    func f(x: Child) {}
    func f(x: Parent) {}
    Test<Top, Top>(f)
    Assert.equals(11, init_id)

    Test<Top, Top>(l2)
    Assert.equals(12, init_id)

    Test<Top, Top>(l1, l1)
    Assert.equals(13, init_id)

    Test<Top, Top>(l1, l2)
    Assert.equals(14, init_id)

    Test<Top, Top>(l1, l1, l1)
    Assert.equals(15, init_id)

    Test<Top, Top>(l2, Parent())
    Assert.equals(16, init_id)

    // Analogous to previous invocation with the 'f', just with more arguments
    Test<Top, Top>(f, Child())
    Assert.equals(17, init_id)

    Test<Top, Top>(Top())
    Assert.equals(18, init_id)

    Test<Top, Top>(Top(), Child())
    Assert.equals(19, init_id)

    Test<Top, Top>(Top(), Parent(), Top())
    Assert.equals(20, init_id)

    Test<Top, Top>(x: l0, y: l0)
    Assert.equals(21, init_id)
}
