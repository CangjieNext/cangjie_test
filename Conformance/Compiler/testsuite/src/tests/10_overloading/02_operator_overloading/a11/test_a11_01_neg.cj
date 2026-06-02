/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a11_01_neg

  @Level:         1

  @Assertion:    10.2(11) Operator functions have the semantics of instance functions,
                 so that static is not allowed here.
  
  @Description:  Example with static operand. Emit error

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
    static operator func + (Right:Int64):Int64 {
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