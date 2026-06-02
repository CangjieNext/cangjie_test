/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_01_a02_01

  @Level:         1

  @Assertion:    10.2.1(2)  For example, suppose opSymbol1 is a unary operator,
                 the operator function opSymbol1 is defined as:
                 operator func opSymbol1(): returnType1 {
                       functionBody1

                 }

  @Description:  Run time example with overloaded unar (!)
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

    public operator func !() :IRange {
        var cur : UInt64 = this.value ^ this.upper ;
        return IRange(cur);
    }
}


main(ina :Array<String>) {
    var v1:IRange = IRange(0xffff_ffff_ffff_fffe)
    var vs:IRange;
    vs = !v1
    Assert.equals(1, vs.value)  
    0
}