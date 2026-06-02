/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_07_a02_02

  @Level:         1

  @Assertion: 6.1.2.7(2)
              Using ClassName(arguments) for defining instances of classes that are not generic.
              In above, ClassName is the name of the class, and arguments is the list of argument.
              ClassName(arguments) will invoke the closest matching constructor
              (based on the rules in section Function Overloading),
              and then generate an instance of ClassName.

  @Description: Check that when creating an instance of a class with multiple constructors,
                the constructor that is geting called is chosen according to the rules
                of invoking overloaded functions

  @Mode: run

  @Negative: no

  @Structure: single

  @CompileWarning: ignore

*/

import utils.assert.Assert

open class Parent {}
class Child <: Parent {}

var init_id = -1

class Test {
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

    init(x: Parent) {
        init_id = 5
    }

    init(x: Child) {
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

    init(x: Parent, y: Parent, z: Parent) {
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
}

main() {
    Test()
    Assert.equals(1, init_id)

    Test(10)
    Assert.equals(2, init_id)

    Test(10, 11)
    Assert.equals(3, init_id)

    Test(10, 11i32)
    Assert.equals(4, init_id)

    Test(Parent())
    Assert.equals(5, init_id)

    Test(Child())
    Assert.equals(6, init_id)

    Test(Child(), Parent())
    Assert.equals(7, init_id)

    Test(Child(), Child())
    Assert.equals(8, init_id)

    Test(Parent(), Child())
    Assert.equals(9, init_id)

    Test(Child(), Child(), Child())
    Assert.equals(10, init_id)

    func l1(x: Parent) {}
    func l2(x: Child) {}
    Test(l1)
    Assert.equals(11, init_id)

    // Here we have not only overloading of constructors
    // But also overloading of arguments
    // So first, the closest matching rule chooses between (Parent) -> Unit and (Child) -> Unit
    // The signature that will be chosen is (Parent) -> Unit since it's the most derived
    // After that the only of two f's that can be passed as the argument is f(x: Parent)
    func f(x: Child) {}
    func f(x: Parent) {}
    Test(f)
    Assert.equals(11, init_id)

    Test(l2)
    Assert.equals(12, init_id)

    Test(l1, l1)
    Assert.equals(13, init_id)

    Test(l1, l2)
    Assert.equals(14, init_id)

    Test(l1, l1, l1)
    Assert.equals(15, init_id)

    Test(l2, Parent())
    Assert.equals(16, init_id)

    // Analogous to previous invocation with the 'f', just with more arguments
    Test(f, Child())
    Assert.equals(17, init_id)
}