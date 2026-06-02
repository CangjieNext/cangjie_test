/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_01_a07_01

  @Level:         1

  @Assertion:    10.2.1(7)
                 Note that operator functions are instance functions, 
                 using the overloaded operator opSymbol on instances A of TypeName is actually
                 the syntax sugar of the function call A.opSymbol(arguments) 
                 (different operator functions are invoked based on the number and types of parameters).


  @Description:  Example with overloaded + - * / and usual functions also used

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
    public func opSymbolPlus (Right:IRange):IRange {
        var cur : Int64 = this.value + Right.value;
        if (cur < lower) {
            cur = lower;
        }
        if (cur > upper) {
            cur = upper;
        }
        return IRange(cur);
    }


    public operator func + (Right:IRange):IRange {
        opSymbolPlus(Right)
    }
    public operator func - (Right:IRange):IRange {
        var cur : Int64 = this.value - Right.value;
        if (cur < lower) {
            cur = lower;
        }
        if (cur > upper) {
            cur = upper;
        }
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
        return IRange(cur);
    }

    public operator func / (Right:IRange):IRange {
        var cur : Int64 = this.value / Right.value;
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
    var v2:IRange = IRange(-2)
    var v3:IRange = IRange(3)
    var vs:IRange;
    vs = (v1 + v2 * v3)/(v2.opSymbolPlus(v3))
    Assert.equals(4, vs.value)    
    0
}