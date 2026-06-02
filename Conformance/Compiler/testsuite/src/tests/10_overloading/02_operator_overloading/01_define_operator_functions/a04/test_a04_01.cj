/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_01_a04_01

  @Level:         1

  @Assertion:    10.2.1(4)  For example, suppose opSymbol2 is 
                 a binary operator, the operator function opSymbol2 can be defined as:
                 operator func opSymbol2(right: anyType): returnType2 {
                     functionBody2

                 }
  
  @Description:  Run time example with overloaded binar operation

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

    public operator func & (Right:IRange) :IRange {
        var cur : UInt64 = this.value & Right.value ;
        return IRange(cur);
    }
}


main(ina :Array<String>) {
    var v1:IRange = IRange( 0xffff_ffff_ffff_ffff)
    var vs:IRange;
    vs = v1 & IRange(1)
    Assert.equals(1, vs.value)  
    0
}