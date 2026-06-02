/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_02_01_a01_01

  @Level:         1

  @Assertion:    10.2.2.1(1)
                 Operator functions have the same scope level
                 as ordinary functions defined or declared in the same location.
 
  @Description:  Overloading operator in super and sub classes.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class Parent {  
    var value : UInt64;
    init(v:UInt64) {
        this.value = v
    }
    open public operator func !() :Parent {
        var cur : UInt64 = this.value ^  0xffff_ffff_ffff_ffff ;
        print("PA:"); println(cur)
        return Parent(cur);
    }

}

open class Sub <: Parent {
    init(v:UInt64) {
        super(v|1)
    }
    public operator func !() :Sub {
        var cur : UInt64 = this.value ^  0 ;
        print("SU:"); println(cur)
        return Sub(cur);
    }

}

main(ina :Array<String>) {
    var pa:Parent = Parent(0xffff)
    var su:Sub = Sub(0xffff00000)
    pa = !pa
    su = !su
    Assert.equals(18446744073709486080,pa.value)
    Assert.equals(0xFFFF00001,su.value)
    0
}

