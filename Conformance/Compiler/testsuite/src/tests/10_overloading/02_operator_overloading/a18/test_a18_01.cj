/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a18_01

  @Level:         1

  @Assertion:    10.2(18) 2. For types that can directly define functions,
                 including class, interface, enum and struct, operator overloading 
                 can be achieved by directly defining operator functions within them.

  @Description:  Some arith operators are introduced for for type IRange
                 which is heir of head class SRange 
  @Mode:         run

  @Negative:     no

  @Structure:    single

*/


import utils.assert.Assert

open class SRange {
    var lower : Int64 = -127;
    var upper : Int64 =  127;
    var value : Int64;
    init(v:Int64) {
        this.value = v
    }
}

class IRange <: SRange {
    init(v:Int64) {
        super(v)
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
    var v2:IRange = IRange(-2)
    var v3:IRange = IRange(3)
    var vs:IRange;
    vs = v1 + v2 * v3
    Assert.equals(4, vs.value)  
    vs = -vs
    Assert.equals(-4, vs.value)  
    v1 = vs/v2
    Assert.equals(2, v1.value)  
    0
}