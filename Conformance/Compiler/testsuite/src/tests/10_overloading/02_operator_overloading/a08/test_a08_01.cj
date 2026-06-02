/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a08_01

  @Level:         1

  @Assertion:    10.2(8) The name of a operator function is the symbol of a operator,
                 and the operator can be overloaded. For details,
                 see [Operators that can be reloaded].                 
  
  @Description:  Example with overloaded operator +

  @Mode:         run

  @Negative:     no

  @Structure:    single

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
    public operator func + (Right:Int32):Int64 {
        var cur : Int64 = this.value + Int64(Right);
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
    Assert.equals(7, ib)    
    var i32:Int64 = otr1 + Int32(-100)
    Assert.equals(0, i32)    
    0
}