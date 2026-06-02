/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a11_02

  @Level:         1

  @Assertion:    11.2(11)
                 The type referenced in the declaration modified by public must be external, specifically: 
    • The type of the inherited class or the implemented interface in the class declaration interface
    declaration enum declaration or struct declaration modified by public must be external and the type of
    members including function variable declaration property modified by public or protected must be external. 
 
  @Description:  Check that type of members including function, variable declaration and property modified by public 
                 or protected must be external.

  @Mode:         run 

  @Negative:     no  

  @Structure:    single

  @Issue:        6124
 
*/

import utils.assert.Assert

public class C1 {}

public class C2 {

    public var obj = C1()

    public func foo(p1: C1) {
        return C1()
    }

    public prop prp: C1 {
        get() { obj }
    }  
    
}

public class C3 {

    protected var obj = C1()

    protected func foo(p1: C1) {
        return C1()
    }

    protected prop prp: C1 {
        get() { obj }
    }
}

public struct S1 {

    public var obj = C1()

    public func foo(p1: C1) {
        return C1()
    }

    public prop prp: C1 {
        get() { obj }
    }
}

main() {
    var obj1 = C1()
    Assert.isTrue(obj1 is C1)

    var obj2 = C2()
    Assert.isTrue(obj2 is C2)
    Assert.isTrue(obj2.foo(obj1) is C1)
    Assert.isTrue(obj2.obj is C1)
    Assert.isTrue(obj2.prp is C1)

    var obj3 = C3()
    Assert.isTrue(obj3 is C3)
    Assert.isTrue(obj3.foo(obj1) is C1)
    Assert.isTrue(obj3.obj is C1)
    Assert.isTrue(obj3.prp is C1)

    var obj4 = S1()
    Assert.isTrue(obj4 is S1)
    Assert.isTrue(obj4.foo(obj1) is C1)
    Assert.isTrue(obj4.obj is C1)
    Assert.isTrue(obj4.prp is C1)
}