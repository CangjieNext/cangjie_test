/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_12_a01_01

  @Level:         1

  @Assertion:    2.1.12(1) The VArraytype is written as the same type (or have a common supertype).
  
  @Description:  VArray of classes. Array assignment.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue:       0006077

  @Comment:     Compiler emit error on VArray<IRange, $3>

*/


import utils.assert.Assert

class IRange {
    var lower: Int64=-3;
    var upper: Int64= 3;
    var value: Int64;
    init(v: Int64) {
        this.value = v
    }
    public operator func + (Right: IRange): IRange {
        var cur : Int64 = this.value + Right.value;
        if (cur < lower) {
            cur = lower;
        }
        if (cur > upper) {
            cur = upper;
        }
        return IRange(cur);
    }
}


main() {
    var otr1: IRange = IRange(1)
    var otr2: IRange = IRange(2)
    var otr3: IRange = IRange(3)
    let arr1: VArray<IRange, $3> = [otr1,otr2,otr3]
    Assert.equals(1, arr1[0].value)
    var arr0: VArray<IRange, $3> = arr1;
    Assert.equals(1, arr0[0].value)
    Assert.equals(2, arr0[1].value)
    Assert.equals(3, arr0[2].value)
    0
}