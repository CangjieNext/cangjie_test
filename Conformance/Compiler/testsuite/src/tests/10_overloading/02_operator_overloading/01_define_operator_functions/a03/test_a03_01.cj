/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_01_a03_01

  @Level:         1

  @Assertion:    10.2.1(3) 2.  For binary operator functions, it has one parameters,
                 the returned value can be any type.

  @Description:  Run time example with overloaded binary operation
                 Implemented as bit negation

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/


import utils.assert.Assert
class IRange {
    var upper : UInt64 = 0xffff_ffff_ffff_ffff;
    var value : UInt64;
    init(v:UInt64) {
        this.value = v
    }

    public operator func | (Right:IRange) :IRange {
        var cur : UInt64 = this.value | Right.value ;
        return IRange(cur);
    }
}


main(ina :Array<String>) {
    var v1:IRange = IRange( 0xffff_ffff_ffff_fffe)
    var vs:IRange;
    vs = v1 | IRange(1)
    Assert.equals(vs.upper, vs.value)  
    0
}