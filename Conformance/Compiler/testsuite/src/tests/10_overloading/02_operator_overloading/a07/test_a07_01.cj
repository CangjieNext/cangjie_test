/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a07_01

  @Level:         1

  @Assertion:    10.2(7)  When defining operator functions, an operator 
                 modifier must be used before the func keyword.

  
  @Description:  Emit error, operator after func

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

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
    public func operator + (Right:Int64):Int64 {
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
    0
}