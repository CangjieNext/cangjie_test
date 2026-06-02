/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a04_01

  @Level:         1

  @Assertion:    10.2(4) In order to overload the operator opSymbol on the type Type,
                 an operator function can be added to Type. After which, the operator function 
                 (named with opSymbol) is automatically called when using operator opSymbol on 
                 instances of Type.

  
  @Description:  Operator overloading example implementing integer range

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:


*/


import utils.assert.Assert
class IRange {
    var lower : Int64;
    var upper : Int64;
    var value : Int64;

    init(l: Int64, u:Int64, v:Int64) {
        this.lower = l
        this.upper = u
        this.value = v
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
    static func min(a:Int64,b:Int64):Int64 {
        if (a<b) {
            a
        }
        else {
            b
        }
    }
    static func max(a:Int64,b:Int64):Int64 {
        if (a>b) {
            a
        }
        else {
            b
        }
    }
    public operator func + (Right:IRange):IRange {
        var cur : Int64 = this.value + Right.value;
        let  l = max(this.lower,Right.lower);
        let  u= min(this.upper,Right.upper) 
        this.lower = l
        this.upper = u
        cur = min(cur,this.upper)
        cur = max(cur,this.lower)
        println(l)
        println(u)
        println(cur)
        IRange(l,u,cur)
    }


}


main(ina :Array<String>) {
    var otr1:IRange = IRange(0,7,6)
    var otr2:IRange = IRange(-5,4, 4)

    var otr = otr1 + otr2;

    Assert.equals(4,otr.upper)    
    Assert.equals(0,otr.lower)    
    Assert.equals(4,otr.value)    
    0
}