/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_01_a01_02

  @Level:         1

  @Assertion:    10.2.1(1) 1. For unary operator functions, it must has no parameter,
                 but the returned value can be any type.

  @Description:  Negative case with overloaded unar (-) w/o return type

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:     compiler however skip operator declaration, error is noticed 
                on operator using (-v1) 

*/


class IRange {
    var lower : Int64 = -127;
    var upper : Int64 =  127;
    var value : Int64;
    init(v:Int64) {
        this.value = v
    }

    public operator func -()  {
        var cur : Int64 = -this.value;
        if (cur < lower) {
            cur = lower;
        }
        if (cur > upper) {
            cur = upper;
        }
    }
}


main(ina :Array<String>) { 
    var v1:IRange = IRange(10)
    var vs:IRange;
    vs = -v1

    0
}