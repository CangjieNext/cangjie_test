/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a09_02

  @Level:         1

  @Assertion:    10.2(9)  The number of parameters of the operator function 
                 must be the same as the number of operands of the operator
  
  @Description:  Example with extra argument in operand 

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:


*/


class IRange {
    var lower : Int64;
    var upper : Int64;
    var value : Int64;
    init(l: Int64, u:Int64) {
        this.lower = l
        this.upper = u
        this.value = 0
    }
    public operator func + (Left:IRange,Right:Int64):Int64 {
        var cur : Int64 = Left.value + Right;
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
    0
}