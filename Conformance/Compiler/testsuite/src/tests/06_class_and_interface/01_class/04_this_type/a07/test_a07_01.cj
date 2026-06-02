/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_04_a07_01

  @Level:         1

  @Assertion: 6.1.4(7)
              The return type of an open function containing This must remain of type This when it is overridden.

  @Description: Check that overriding a function of the type This is legal
                if the type of new function is This

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

open class Open {
    public open func f1(): This {
        this
    }
    protected open func f2(): This {
        return this
    }
}

abstract class Abstract {
    public open func f1(): This {
        this
    }
    protected open func f2(): This {
        return this
    }
    public open func f3(): This 
    protected open func f4(): This
}

sealed abstract class Sealed {
    public open func f1(): This {
        this
    }
    protected open func f2(): This {
        return this
    }
}

class Test1 <: Open {
    override public func f1(): This {
        this
    }
    override protected func f2(): This {
        return this
    }
}

class Test2 <: Abstract {
    override public func f1(): This {
        this
    }
    override protected func f2(): This {
        return this
    }

    public func f3(): This {
        this
    }
    protected func f4(): This {
        return this
    }
}

class Test3 <: Sealed {
    override public func f1(): This {
        this
    }
    override protected func f2(): This {
        return this
    }
}

main() {
    let case1 = Test1()
    Assert.isTrue(case1.f1() is Test1)
    Assert.isTrue(case1.f2() is Test1)

    let case2 = Test2()
    Assert.isTrue(case2.f1() is Test2)
    Assert.isTrue(case2.f2() is Test2)
    Assert.isTrue(case2.f3() is Test2)
    Assert.isTrue(case2.f4() is Test2)

    let case3 = Test3()
    Assert.isTrue(case3.f1() is Test3)
    Assert.isTrue(case3.f2() is Test3)
}