/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_02_a04_01

  @Level:         1

  @Assertion:    10.1.3.2(4) If a function has named arguments, the sequence of the named arguments 
                 may be different from that of the parameters. In this case, the sequence of the parameters 
                 used for overloading resolution must be the same as that of the arguments to ensure that 
                 the parameters used for comparison of the two candidate functions are corresponding.

  
  @Description:  Sequence of arguments in call with named arguments is changed

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
    Assert.equals(6,Check(b:true,a:b))
    Assert.equals(6,Check(b:true,a:ss))
    0
}

