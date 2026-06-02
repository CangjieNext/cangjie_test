/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a05_01

  @Level:         1

  @Assertion: 6.1.2.4(5)
              Whenever a instance member function is called,
              it means that a complete object needs to be passed in first,
              so the instance member function is called
              before the object is created is forbidden,
              but the type of the function will not include the implicit parameter.
              The basis for judging the completion of class object creation
              is that the constructor of the class has been called.

  @Description: Check that an instance member function can be called after the constructor
                of the class is called

  @Mode: run

  @Negative: no

  @Structure: single


*/

import utils.assert.Assert

open class Test {
    func f1() {
        return 1
    }
    func f2<T>() {
        return 2
    }
    private func f3() {
        return 3
    }
    private func f4<T>() {
        return 4
    }
    protected func f5() {
        return 5
    }
    protected func f6<T>() {
        return 6
    }
    public func f7() {
        return 7
    }
    public func f8<T>() {
        return 8
    }
    public open func f9() {
        return 9
    }

    static func test() {
        let obj = Test()
        Assert.equals(1, obj.f1())
        Assert.equals(2, obj.f2<String>())
        Assert.equals(3, obj.f3())
        Assert.equals(4, obj.f4<Float64>())
        Assert.equals(5, obj.f5())
        Assert.equals(6, obj.f6<Rune>())
        Assert.equals(7, obj.f7())
        Assert.equals(8, obj.f8<Unit>())
        Assert.equals(9, obj.f9())
    }
}

main() {
    Test.test()
}
