/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a05_02

  @Level:         1

  @Assertion: 6.1.2.4(5)
              Whenever a instance member function is called,
              it means that a complete object needs to be passed in first,
              so the instance member function is called
              before the object is created is forbidden,
              but the type of the function will not include the implicit parameter.
              The basis for judging the completion of class object creation
              is that the constructor of the class has been called.

  @Description: Check that the type of the function does not include implicit 'this'

  @Mode: run

  @Negative: no

  @Structure: single


*/

import utils.assert.Assert

class Test {
    func f1() {}

    func f2(x: Int64) {}

    func f3(x: Test) {}

    func f4() {
        return this
    }

    func f5(x: Test) {
        return this
    }

    func g1<T>() {}

    func g2<T>(x: Int64) {}

    func g3<T>(x: Test) {}

    func g4<T>() {
        return this
    }

    func g5<T>(x: Test) {
        return this
    }

    static func test() {
        let obj = Test()

        Assert.isTrue(obj.f1 is () -> Unit)
        Assert.isFalse(obj.f1 is (Test) -> Unit)
        Assert.isTrue(obj.f2 is (Int64) -> Unit)
        Assert.isFalse(obj.f2 is (Test, Int64) -> Unit)
        Assert.isTrue(obj.f3 is (Test) -> Unit)
        Assert.isFalse(obj.f3 is (Test, Test) -> Unit)
        Assert.isTrue(obj.f4 is () -> Test)
        Assert.isFalse(obj.f4 is (Test) -> Test)
        Assert.isTrue(obj.f5 is (Test) -> Test)
        Assert.isFalse(obj.f5 is (Test, Test) -> Test)

        Assert.isTrue(obj.g1<Bool> is () -> Unit)
        Assert.isFalse(obj.g1<Bool> is (Test) -> Unit)
        Assert.isTrue(obj.g2<Test> is (Int64) -> Unit)
        Assert.isFalse(obj.g2<Test> is (Test, Int64) -> Unit)
        Assert.isTrue(obj.g3<String> is (Test) -> Unit)
        Assert.isFalse(obj.g3<String> is (Test, Test) -> Unit)
        Assert.isTrue(obj.g4<Int64> is () -> Test)
        Assert.isFalse(obj.g4<Int64> is (Test) -> Test)
        Assert.isTrue(obj.g5<Rune> is (Test) -> Test)
        Assert.isFalse(obj.g5<Rune> is (Test, Test) -> Test)
    }
}

main() {
    Test.test()
}