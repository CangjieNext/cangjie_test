/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a04_01

  @Level:         1

  @Assertion: 6.1.2.4(4)
              The first implicit parameter of a instance member function is this.

  @Description: Check that this can be a default value of the first parameter of an instance function

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: This check relies on the following assertions:
            - The default value of the parameter is evaluated when the function is called,
                not when the function is defined.
            - When a function is called, the parameter values are evaluated from left to right
                according to the sequence of definition.
                The default value of a function parameter can reference
                the formal parameter defined before the parameter.
            If a named parameter can access 'this' it means 'this' is not defined
            inside the function body. Checking that 'this' is the object at the call time
            means it was evaluated during the call like a parameter.

*/

import utils.assert.Assert

class A {
    public func f1(x!: A = this) {
        // Check that 'this' corresponds to the instance at the moment of the call
        // meaning it was evaluated at the call time, like a parameter should
        Assert.equals(1, x.indicator)

        // Check that 'this' is accessible inside the function body
        // and that it's the same as the instance object during the function invocation
        let o = this
        Assert.equals(1, o.indicator)

        // Check that 'this' and 'x' point to the same object
        this.indicator = -1
        Assert.equals(-1, x.indicator)
        x.indicator = -2
        Assert.equals(-2, this.indicator)
    }
    public func f2<T>(x!: A = this) {
        Assert.equals(2, x.indicator)

        let o = this
        Assert.equals(2, o.indicator)

        this.indicator = -1
        Assert.equals(-1, x.indicator)
        x.indicator = -2
        Assert.equals(-2, this.indicator)
    }
    protected func f3(x!: A = this) {
        Assert.equals(3, x.indicator)

        let o = this
        Assert.equals(3, o.indicator)

        this.indicator = -1
        Assert.equals(-1, x.indicator)
        x.indicator = -2
        Assert.equals(-2, this.indicator)
    }
    protected func f4<T>(x!: A = this) {
        Assert.equals(4, x.indicator)

        let o = this
        Assert.equals(4, o.indicator)

        this.indicator = -1
        Assert.equals(-1, x.indicator)
        x.indicator = -2
        Assert.equals(-2, this.indicator)
    }
    private func f5(x!: A = this) {
        Assert.equals(5, x.indicator)

        let o = this
        Assert.equals(5, o.indicator)

        this.indicator = -1
        Assert.equals(-1, x.indicator)
        x.indicator = -2
        Assert.equals(-2, this.indicator)
    }
    private func f6<T>(x!: A = this) {
        Assert.equals(6, x.indicator)

        let o = this
        Assert.equals(6, o.indicator)

        this.indicator = -1
        Assert.equals(-1, x.indicator)
        x.indicator = -2
        Assert.equals(-2, this.indicator)
    }
    func f7(x!: A = this) {
        Assert.equals(7, x.indicator)

        let o = this
        Assert.equals(7, o.indicator)

        this.indicator = -1
        Assert.equals(-1, x.indicator)
        x.indicator = -2
        Assert.equals(-2, this.indicator)
    }
    func f8<T>(x!: A = this) {
        Assert.equals(8, x.indicator)

        let o = this
        Assert.equals(8, o.indicator)

        this.indicator = -1
        Assert.equals(-1, x.indicator)
        x.indicator = -2
        Assert.equals(-2, this.indicator)
    }

    var indicator = 0

    static func test() {
        var obj = A()
        obj.indicator = 1
        obj.f1()
        obj.indicator = 2
        obj.f2<Bool>()
        obj.indicator = 3
        obj.f3()
        obj.indicator = 4
        obj.f4<Bool>()
        obj.indicator = 5
        obj.f5()
        obj.indicator = 6
        obj.f6<Bool>()
        obj.indicator = 7
        obj.f7()
        obj.indicator = 8
        obj.f8<Bool>()
    }
}

main() {
    A.test()
}