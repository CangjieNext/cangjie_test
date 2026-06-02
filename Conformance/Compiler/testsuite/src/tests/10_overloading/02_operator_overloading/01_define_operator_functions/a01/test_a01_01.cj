/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_01_a01_01

  @Level:         1

  @Assertion:    10.2.1(1) 1. For unary operator functions, it must has no parameter,
                 but the returned value can be any type.

  @Description:  Run time example with overloaded unar (-)

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/


import utils.assert.Assert
class IRange {
    var lower : Int64 = -127;
    var upper : Int64 =  127;
    var value : Int64;
    init(v:Int64) {
        this.value = v
    }

    public operator func -() :IRange {
        var cur : Int64 = -this.value;
        if (cur < lower) {
            cur = lower;
        }
        if (cur > upper) {
            cur = upper;
        }
        return IRange(cur);
    }
}


main(ina :Array<String>) {
    var v1:IRange = IRange(10)
    var vs:IRange;
    vs = -v1
    Assert.equals(-10, vs.value)  
    0
}