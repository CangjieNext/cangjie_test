/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a18_03

  @Level:         1

  @Assertion:    10.2(18) 2. For types that can directly define functions,
                 including class, interface, enum and struct, operator overloading 
                 can be achieved by directly defining operator functions within them.

  @Description:  Some arith operators are introduced for for type SRange
                 which is struct with interface
  @Mode:         run

  @Negative:     no

  @Structure:    single

*/


import utils.assert.Assert

interface IF {
     operator func + (Right:SRange):SRange 
     operator func * (Right:SRange):SRange 
     operator func / (Right:SRange):SRange 
     operator func -() :SRange
}

struct SRange <: IF {
    var lower : Int64 = -127;
    var upper : Int64 =  127;
    var value : Int64;
    init(v:Int64) {
        this.value = v
    }

    public operator func + (Right:SRange):SRange {
        var cur : Int64 = this.value + Right.value;
        if (cur < lower) {
            cur = lower;
        }
        if (cur > upper) {
            cur = upper;
        }
        return SRange(cur);
    }

    public operator func * (Right:SRange):SRange {
        var cur : Int64 = this.value * Right.value;
        if (cur < lower) {
            cur = lower;
        }
        if (cur > upper) {
            cur = upper;
        }
        return SRange(cur);
    }
    public operator func / (Right:SRange):SRange {
        var cur : Int64 = this.value / Right.value;
        if (cur < lower) {
            cur = lower;
        }
        if (cur > upper) {
            cur = upper;
        }
        return SRange(cur);
    }

    public operator func -() :SRange {
        var cur : Int64 = -this.value;
        if (cur < lower) {
            cur = lower;
        }
        if (cur > upper) {
            cur = upper;
        }
        return SRange(cur);
    }
    
}

main(ina :Array<String>) {
    var v1:SRange = SRange(10)
    var v2:SRange = SRange(-2)
    var v3:SRange = SRange(3)
    var vs:SRange;
    vs = v1 + v2 * v3
    Assert.equals(4, vs.value)  
    vs = -vs
    Assert.equals(-4, vs.value)  
    v1 = vs/v2
    Assert.equals(2, v1.value)  
    0
}