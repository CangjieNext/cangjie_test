/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_01_a05_01

  @Level:         1

  @Assertion:    10.2.1(5) Similarly, after defining operator functions in TypeName,
                 opSymbol1 to opSymbolN can be directly used over instances of TypeName.

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

    private operator func & (Right:IRange) :IRange {
        var cur : UInt64 = this.value | Right.value ;
        return IRange(cur);
    }
    public operator func | (Right:IRange) :IRange {
        this & Right
    }
}


main(ina :Array<String>) {
    var v1:IRange = IRange( 0xffff_ffff_ffff_fffe)
    var vs:IRange;
    vs = v1 | IRange(1)
    Assert.equals(vs.upper, vs.value)  
    0
}
