/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a03_05

  @Level:         1

  @Assertion:    3.4.2(3) override means overriding a member of the parent class, See class for details

  @Description:  Check that property can be overriden.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        6124
*/

import utils.assert.Assert

open class C1 {
    protected var a = 0

    public open mut prop b: Int64 {
        get() { a }
        set(value) { a = value }
    }
}

class C2 <: C1 {
    override public mut prop b: Int64 {
        get() { a + 10 }
        set(value) {a = value + value}
    }
}

class C3 <: C1 {
    override public mut prop b: Int64 {
        get() { a + 5 }
    }
}

class C4 <: C1 {
    override public mut prop b: Int64 {
        set(value) { a = value * value }
    }
}

main() {
    var obj1 = C1()
    var obj2 = C2()
    var obj3 = C3()
    var obj4 = C4()

    Assert.equals(0, obj1.b)
    Assert.equals(10, obj2.b)
    Assert.equals(5, obj3.b)
    Assert.equals(0, obj4.b)

    obj1.b = 1
    obj2.b = 1007
    obj3.b = 1
    obj4.b = 2

    Assert.equals(1, obj1.b)
    Assert.equals(2024, obj2.b)
    Assert.equals(6, obj3.b)
    Assert.equals(4, obj4.b)
}
