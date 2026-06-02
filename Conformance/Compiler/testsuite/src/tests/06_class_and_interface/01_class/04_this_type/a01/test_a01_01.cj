/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_04_a01_01

  @Level:         1

  @Assertion: 6.1.4(1)
              Within a class, we support a This type placeholder,
              which can only be used as the return type of an instance member function
              and is replaced with the type of the class where the function is located at compile time.

  @Description: Check that instance functions can have This return type
                and the final type of the function is replaced to the actual class type

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006299

*/

import utils.assert.Assert

open class Test1 {
    func f1(): This {
        return this
    }

    func f2(x: Int64): This {
        return this
    }

    func f3<T>(): This {
        return this
    }

    func f4<T>(x: Int64): This {
        return this
    }

    public func f5(): This {
        return this
    }
    
    public func f6(x: Int64): This {
        return this
    }

    public func f7<T>(): This {
        return this
    }

    public func f8<T>(x: Int64): This {
        return this
    }

    protected func f9(): This {
        return this
    }
    
    protected func f10(x: Int64): This {
        return this
    }

    protected func f11<T>(): This {
        return this
    }

    protected func f12<T>(x: Int64): This {
        return this
    }

    private func f13(): This {
        return this
    }
    
    private func f14(x: Int64): This {
        return this
    }

    private func f15<T>(): This {
        return this
    }

    private func f16<T>(x: Int64): This {
        return this
    }

    operator func -(rhs: Test1): This {
        return this
    }

    operator func !(): This {
        return this
    }

    operator func [](index: Int64): This {
        return this
    }

    static func test() {
        let tst = Test1()
        Assert.isTrue(tst.f1() is Test1)
        Assert.isTrue(tst.f2(1) is Test1)
        Assert.isTrue(tst.f3<Unit>() is Test1)
        Assert.isTrue(tst.f4<Unit>(1) is Test1)

        Assert.isTrue(tst.f5() is Test1)
        Assert.isTrue(tst.f6(1) is Test1)
        Assert.isTrue(tst.f7<Unit>() is Test1)
        Assert.isTrue(tst.f8<Unit>(1) is Test1)

        Assert.isTrue(tst.f9() is Test1)
        Assert.isTrue(tst.f10(1) is Test1)
        Assert.isTrue(tst.f11<Unit>() is Test1)
        Assert.isTrue(tst.f12<Unit>(1) is Test1)

        Assert.isTrue(tst.f13() is Test1)
        Assert.isTrue(tst.f14(1) is Test1)
        Assert.isTrue(tst.f15<Unit>() is Test1)
        Assert.isTrue(tst.f16<Unit>(1) is Test1)

        Assert.isTrue(tst.f1 is () -> Test1)
        Assert.isTrue(tst.f2 is (Int64) -> Test1)
        Assert.isTrue(tst.f3<Unit> is () -> Test1)
        Assert.isTrue(tst.f4<Unit> is (Int64) -> Test1)

        Assert.isTrue(tst.f5 is () -> Test1)
        Assert.isTrue(tst.f6 is (Int64) -> Test1)
        Assert.isTrue(tst.f7<Unit> is () -> Test1)
        Assert.isTrue(tst.f8<Unit> is (Int64) -> Test1)

        Assert.isTrue(tst.f9 is () -> Test1)
        Assert.isTrue(tst.f10 is (Int64) -> Test1)
        Assert.isTrue(tst.f11<Unit> is () -> Test1)
        Assert.isTrue(tst.f12<Unit> is (Int64) -> Test1)

        Assert.isTrue(tst.f13 is () -> Test1)
        Assert.isTrue(tst.f14 is (Int64) -> Test1)
        Assert.isTrue(tst.f15<Unit> is () -> Test1)
        Assert.isTrue(tst.f16<Unit> is (Int64) -> Test1)

        Assert.isTrue((tst - tst) is Test1)
        Assert.isTrue(!tst is Test1)
        Assert.isTrue(tst[0] is Test1)
    }
}

abstract class A {
    public func f1(): This
    public func f2(x: Int64): This
    protected func f3(): This
    protected func f4(x: Int64): This
}

class Test2 <: A {
    public func f1(): This {
        return this
    }

    public func f2(x: Int64): This {
        return this
    }

    protected func f3(): This {
        return this
    }

    protected func f4(x: Int64): This {
        return this
    }

    static func test() {
        let tst = Test2()
        Assert.isTrue(tst.f1() is Test2)
        Assert.isTrue(tst.f2(1) is Test2)
        Assert.isTrue(tst.f3() is Test2)
        Assert.isTrue(tst.f4(1) is Test2)

        Assert.isTrue(tst.f1 is () -> Test2)
        Assert.isTrue(tst.f2 is (Int64) -> Test2)
        Assert.isTrue(tst.f3 is () -> Test2)
        Assert.isTrue(tst.f4 is (Int64) -> Test2)
    }
}

class Test3 <: Test1 {
    static func test() {
        let tst = Test3()
        Assert.isTrue(tst.f1() is Test3)
        Assert.isTrue(tst.f2(1) is Test3)
        Assert.isTrue(tst.f3<Unit>() is Test3)
        Assert.isTrue(tst.f4<Unit>(1) is Test3)

        Assert.isTrue(tst.f5() is Test3)
        Assert.isTrue(tst.f6(1) is Test3)
        Assert.isTrue(tst.f7<Unit>() is Test3)
        Assert.isTrue(tst.f8<Unit>(1) is Test3)

        Assert.isTrue(tst.f9() is Test3)
        Assert.isTrue(tst.f10(1) is Test3)
        Assert.isTrue(tst.f11<Unit>() is Test3)
        Assert.isTrue(tst.f12<Unit>(1) is Test3)

        Assert.isTrue(tst.f1 is () -> Test3)
        Assert.isTrue(tst.f2 is (Int64) -> Test3)
        Assert.isTrue(tst.f3<Unit> is () -> Test3)
        Assert.isTrue(tst.f4<Unit> is (Int64) -> Test3)

        Assert.isTrue(tst.f5 is () -> Test1)
        Assert.isTrue(tst.f6 is (Int64) -> Test3)
        Assert.isTrue(tst.f7<Unit> is () -> Test3)
        Assert.isTrue(tst.f8<Unit> is (Int64) -> Test3)

        Assert.isTrue(tst.f9 is () -> Test3)
        Assert.isTrue(tst.f10 is (Int64) -> Test3)
        Assert.isTrue(tst.f11<Unit> is () -> Test3)
        Assert.isTrue(tst.f12<Unit> is (Int64) -> Test3)

        Assert.isTrue((tst - tst) is Test3)
        Assert.isTrue(!tst is Test3)
        Assert.isTrue(tst[0] is Test3)
    }
}

main() {
    Test1.test()
    Test2.test()
    Test3.test()
}