/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a14_03_neg

  @Level:         1

  @Assertion:    10.2(14)The usage of unary operators to be prefix operators or 
                 suffix operators keeps consistent with the default usage of them. 
                 Since there are no operators in the Cangjie programming language 
                 that can be used as both a prefix and a suffix operator, there will be no confusion
  
  @Description:  Postfix operator can not be overloading

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:

*/


class IRange {
    var lower : Int64;
    var upper : Int64;
    var value : Int64;
    init(u:Int64) {
        this.lower = -255
        this.upper = 255
        this.value = u
    }
    public operator func + (Right:IRange):IRange {
        var cur : Int64 = this.value + Right.value;
        if (cur < lower) {
            cur = lower;
        }
        if (cur > upper) {
            cur = upper;
        }
        return IRange(cur);
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

    public operator func ?()  {
        var cur : Int64 = this.value + 1;
        if (cur < lower) {
            cur = lower;
        }
        if (cur > upper) {
            cur = upper;
        }
        this.value = cur;
    }

}


main(ina :Array<String>) {
}