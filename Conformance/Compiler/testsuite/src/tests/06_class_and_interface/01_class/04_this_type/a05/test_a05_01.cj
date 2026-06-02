/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_04_a05_01

  @Level:         1

  @Assertion: 6.1.4(5)
              Any use of This type expressions outside of the return value will be inferred as the current type.

  @Description: Check that This type expressions will be inferred as the current type
                when used in declarations and instantiations

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

class Tester<T> {
    init(x: T) {}
}

class Test {
    func f(): This {
        this
    }

    operator func !(): This {
        return f()
    }

    func test_instantiation() {
        let x = Tester(f())
        Assert.isTrue(x is Tester<Test>)

        let y = Tester(this)
        Assert.isTrue(y is Tester<Test>)

        let z = Tester(!this)
        Assert.isTrue(z is Tester<Test>)
    }

    // Since the current type can not be cast down to This
    // if the type of variables is inferred to be This
    // they can not be assigned instances of the current class
    func test_assignment() {
        var x = this
        x = Test()
        Assert.isTrue(x is Test)

        var y = f()
        y = Test()
        Assert.isTrue(y is Test)

        var z = !this
        z = Test()
        Assert.isTrue(z is Test)
    }
}

main() {
    Test().test_instantiation()
    Test().test_assignment()
}