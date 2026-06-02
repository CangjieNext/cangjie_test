/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a10_05

  @Level:         1

  @Assertion:   10.2(10)  Operator functions can only be defined in class, interface, struct, enum, and extend. 
  
  @Description:  Operator overloading example implementing integer range in extend

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:


*/

import utils.assert.Assert

class IRange {
    var lower : Int64;
    var upper : Int64;
    var value : Int64;
    init(l: Int64, u:Int64) {
        this.lower = l
        this.upper = u
        this.value = 0
    }
}

extend IRange {
    public operator func + (Right:Int64):Int64 {
        var cur : Int64 = this.value + Right;
        if (cur < lower) {
            cur = lower;
        }
        if (cur > upper) {
            cur = upper;
        }
        return cur;
    }
}

main(ina :Array<String>) {
    var otr1:IRange = IRange(0,7)
    var ib:Int64 = otr1 + 15
    Assert.equals(otr1.upper, ib)    
    var ib2:Int64 = otr1 + (-1)
    Assert.equals(otr1.lower, ib2)    
    0
}
