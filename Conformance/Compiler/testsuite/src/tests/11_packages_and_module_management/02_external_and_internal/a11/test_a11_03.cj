/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a11_03

  @Level:         1

  @Assertion:    11.2(11)
                 The type referenced in the declaration modified by public must be external, specifically: 
    • The type of the inherited class or the implemented interface in the class declaration interface
    declaration enum declaration or struct declaration modified by public must be external and the type of
    members including function variable declaration property modified by public or protected must be external. 
 
  @Description:  Check that type of members including function, variable declaration and property modified by private 
                 can be internal.

  @Mode:         run 

  @Negative:     no  

  @Structure:    single

  @Issue:        6124
 
*/

import utils.assert.Assert

class C1 {}

public class C2 {

    private var obj = C1()

    private func foo(p1: C1) {
        return C1()
    }

    private prop prp: C1 {
        get() { obj }
    }

    public func checkObj() {
        Assert.isTrue(obj is C1)
    }

    public func checkFoo() {
        Assert.isTrue(foo(obj) is C1)
    }

    public func checkPrp() {
        Assert.isTrue(prp is C1)
    }
}

public class C3 {
    var obj = C1()

    func foo(p1: C1) {
        return p1
    }
    
    prop prp: C1 {
        get() { obj }
    }
}

public struct S1 {

    private var obj = C1()

    private func foo(p1: C1) {
        return C1()
    }

    private prop prp: C1 {
        get() { obj }
    }

    public func checkObj() {
        Assert.isTrue(obj is C1)
    } 

    public func checkFoo() {
        Assert.isTrue(foo(obj) is C1)
    }

    public func checkPrp() {
        Assert.isTrue(prp is C1)
    }
}

public struct S2 {
    var obj = C1()

    func foo(p1: C1) {
        return p1
    }

    prop prp: C1 {
        get() { obj }
    }
}

main() {
    var obj1 = C1()
    Assert.isTrue(obj1 is C1)

    var obj2 = C2()
    Assert.isTrue(obj2 is C2)
    obj2.checkFoo()
    obj2.checkObj()
    obj2.checkPrp()

    var obj3 = C3()
    Assert.isTrue(obj3 is C3)
    Assert.isTrue(obj3.obj is C1)
    Assert.isTrue(obj3.foo(C1()) is C1)
    Assert.isTrue(obj3.prp is C1)

    var obj4 = S1()
    Assert.isTrue(obj4 is S1)
    obj4.checkFoo()
    obj4.checkObj()
    obj4.checkPrp()

    var obj5 = S2()
    Assert.isTrue(obj5 is S2)
    Assert.isTrue(obj5.obj is C1)
    Assert.isTrue(obj5.foo(C1()) is C1)
    Assert.isTrue(obj5.prp is C1)

    return 0
}