/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a11_01

  @Level:         1

  @Assertion:    11.2(11)
                 The type referenced in the declaration modified by public must be external, specifically: 
    • The type of the inherited class or the implemented interface in the class declaration interface
    declaration enum declaration or struct declaration modified by public must be external and the type of
    members including function variable declaration property modified by public or protected must be external. 
 
  @Description:  Check that type of the inherited class or the implemented interface in the class declaration,
                 interface declaration, enum declaration or struct declaration modified by public must be external.

  @Mode:         run 

  @Negative:     no  

  @Structure:    single
 
*/

import utils.assert.Assert

public open class C1 {
    var currentYear = 2023
}

public interface I1 {
    func foo1() {
        return "foo1"
    }
}

public interface I2<C1> {
    func foo2() {
        return "foo2"
    }
}
 
public class C2 <: C1 {}

public class C3 <: I1 {}

public class C4 <: I2<C1> {}

public struct S1 <: I1 {}

public struct S2 <: I2<C1> {}

public enum E1 {
    | FirstVal(C1)
    | SecondVal(Float64)
}

main() {
    var obj1 = C1()
    Assert.isTrue(obj1 is C1)
    Assert.equals(2023, obj1.currentYear)

    var obj2 = C2()
    Assert.isTrue(obj2 is C2)
    Assert.equals(2023, obj2.currentYear)

    var obj3 = C3()
    Assert.isTrue(obj3 is C3)
    Assert.equals("foo1", obj3.foo1())

    var obj4 = C4()
    Assert.isTrue(obj4 is C4)
    Assert.equals("foo2", obj4.foo2())

    var obj5 = S1()
    Assert.isTrue(obj5 is S1)
    Assert.equals("foo1", obj5.foo1())

    var obj6 = S2()
    Assert.isTrue(obj6 is S2)
    Assert.equals("foo2", obj6.foo2())

    var obj7 = E1.FirstVal(obj1)
    Assert.isTrue(obj7 is E1)

    return 0
}