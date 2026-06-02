/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a15_02_neg

  @Level:         1

  @Assertion:    10.2(15) The way that operator functions are invoked follows 
                 the way that operators are used. Determine which operator function
                 to call based on the number and type of operands when multiple 
                 operator functions with the same symbol.


  @Description:   unar (-) cannot be overloaded

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/


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

    public operator func +() :IRange {
        var cur : Int64 = this.value;
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
}