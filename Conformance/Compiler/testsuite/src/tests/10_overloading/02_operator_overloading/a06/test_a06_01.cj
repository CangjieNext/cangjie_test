/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a06_01

  @Level:         1

  @Assertion:    10.2(6) The operator function definition is similar 
                 to the ordinary function definition
  
  @Description:  It is shown equivalence function and operator

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
    public func add (Right:Int64):Int64 {
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
    var fb:Int64 = otr1.add(15)
    Assert.equals(fb, ib)    
    0
}