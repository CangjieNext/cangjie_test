/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a13_01

  @Level:         1

  @Assertion:    10.2(13) It should be noted that the operators that are overloaded 
                 do not change their precedence and associativity 
                 (For details about the precedence and associativity, see Chapter 4).

  @Description:  Example wuth overloaded + and *

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
    public operator func + (Right:IRange):IRange {
        var cur : Int64 = this.value + Right.value;
        if (cur < lower) {
            cur = lower;
        }
        if (cur > upper) {
            cur = upper;
        }
        print("+:"); println(cur)
        return IRange(cur);
    }
    public operator func * (Right:IRange):IRange {
        var cur : Int64 = this.value * Right.value;
        if (cur < lower) {
            cur = lower;
        }
        if (cur > upper) {
            cur = upper;
        }
        print("*:"); println(cur)
        return IRange(cur);
    }

}


main(ina :Array<String>) {
    var v1:IRange = IRange(10)
    var v2:IRange = IRange(-2)
    var v3:IRange = IRange(3)
    var vs:IRange;
    vs = v1 + v2 * v3
    Assert.equals(4, vs.value)    
    0
}