/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_02_a02_01

  @Level:         1

  @Assertion:    10.1.3.2(2) The comparison between two matches is the comparison of 
                 the formal parameters of two matches:
                 Step 1: Specify the quantity and order of the shape parameters 
                 used for comparison in overloading resolution.
                 Note that if the function parameter has a default value, 
                 the default parameter that does not specify 
                 an argument does not participate in the overload resolution.
 
  @Description:  Scopes in class chain.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

open class Base {   

}
class Sub <: Base {
}

class SubSub <: Base{
}

var vb:Base = Base();

func Check(a:Base) :Int64 {
    return 1
}

func Check(a:Sub):Int64 {
    return 2
}

func Check(a:Sub,b!: Bool = false) :Int64 {
    Assert.isTrue(b)
    return 4
}
func Check(a:SubSub,b!: Bool = false) :Int64 {
    Assert.isTrue(b)
    return 3
}
func Check(a!:Base = vb,b!: Bool = true) :Int64 {
    Assert.isTrue(b)
    return 6
}

main(ina :Array<String>) {
    var b : Base = Base()
    var s : Sub = Sub()
    var ss : SubSub = SubSub()
    Assert.equals(1,Check(b))
    Assert.equals(4,Check(s,b:true))
    Assert.equals(3,Check(ss,b:true))
    Assert.equals(6,Check())
    Assert.equals(6,Check(a:b,b:true))
    Assert.equals(6,Check(a:ss,b:true))
    0
}

