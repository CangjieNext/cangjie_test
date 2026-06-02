/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_04_a08_02

  @Level:         1

  @Assertion: 6.1.4(8)
              If the return type of the open function in the parent class is the parent class,
              the child class can use This as the return type when overriding.

  @Description: Check that if the return type of an open function is the parent class,
                the child class can leave the return type as is

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

open class Open {
    public open func f1(): Open {
        return this
    }
    protected open func f2(): Open {
        return this
    }
}

open class OpenGeneric<T> {
    public open func f1(): OpenGeneric<T> {
        return this
    }
    protected open func f2(): OpenGeneric<T> {
        return this
    }
}

abstract class Abstract {
    public open func f1(): Abstract {
        return this
    }
    protected open func f2(): Abstract {
        return this
    }
    public open func f3(): Abstract
    protected open func f4(): Abstract
}

abstract class AbstractGeneric<T> {
    public open func f1(): AbstractGeneric<T> {
        return this
    }
    protected open func f2(): AbstractGeneric<T> {
        return this
    }
    public open func f3(): AbstractGeneric<T>
    protected open func f4(): AbstractGeneric<T>
}

sealed abstract class Sealed {
    public open func f1(): Sealed {
        return this
    }
    protected open func f2(): Sealed {
        return this
    }
}

sealed abstract class SealedGeneric<T> {
    public open func f1(): SealedGeneric<T> {
        return this
    }
    protected open func f2(): SealedGeneric<T> {
        return this
    }
}

class Test1 <: Open {
    override public func f1(): Open {
        return this
    }
    override protected func f2(): Open {
        return this
    }
}

class Test2<T> <: OpenGeneric<T> {
    override public func f1(): OpenGeneric<T> {
        return this
    }
    override protected func f2(): OpenGeneric<T> {
        return this
    }
}

class Test3 <: Abstract {
    override public func f1(): Abstract {
        return this
    }
    override protected func f2(): Abstract {
        return this
    }
    override public func f3(): Abstract {
        return this
    }
    override protected func f4(): Abstract {
        return this
    }
}

class Test4<T> <: AbstractGeneric<T> {
    override public func f1(): AbstractGeneric<T> {
        return this
    }
    override protected func f2(): AbstractGeneric<T> {
        return this
    }
    override public func f3(): AbstractGeneric<T> {
        return this
    }
    override protected func f4(): AbstractGeneric<T> {
        return this
    }
}

class Test5 <: Sealed {
    override public func f1(): Sealed {
        return this
    }
    override protected func f2(): Sealed {
        return this
    }
}

class Test6<T> <: SealedGeneric<T> {
    override public func f1(): SealedGeneric<T> {
        return this
    }
    override protected func f2(): SealedGeneric<T> {
        return this
    }
}

main() {
    let case1 = Test1()
    Assert.isTrue(case1.f1() is Test1)
    Assert.isTrue(case1.f2() is Test1)

    let case2 = Test2<Int32>()
    Assert.isTrue(case2.f1() is Test2<Int32>)
    Assert.isTrue(case2.f2() is Test2<Int32>)

    let case3 = Test3()
    Assert.isTrue(case3.f1() is Test3)
    Assert.isTrue(case3.f2() is Test3)
    Assert.isTrue(case3.f3() is Test3)
    Assert.isTrue(case3.f4() is Test3)

    let case4 = Test4<String>()
    Assert.isTrue(case4.f1() is Test4<String>)
    Assert.isTrue(case4.f2() is Test4<String>)
    Assert.isTrue(case4.f3() is Test4<String>)
    Assert.isTrue(case4.f4() is Test4<String>)

    let case5 = Test5()
    Assert.isTrue(case5.f1() is Test5)
    Assert.isTrue(case5.f2() is Test5)

    let case6 = Test6<Bool>()
    Assert.isTrue(case6.f1() is Test6<Bool>)
    Assert.isTrue(case6.f2() is Test6<Bool>)
}