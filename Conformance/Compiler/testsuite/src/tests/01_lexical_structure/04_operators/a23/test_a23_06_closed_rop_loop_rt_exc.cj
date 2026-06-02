/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a23_06

  @Level:         1

  @Assertion:    1.4(23) .. ..= Range operator
 
  @Description:  Emit exception  as arr is out of bounds (due to ..=7)

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

  @Issue:        0006505

*/

import utils.assert.Assert

main(ina :Array<String>) {
    let carr:Array<Int32>=[0,1,2,3,4,5,6,7,8]
    var arr = Array<Int32>(3) {
        i=>0
    }

    try {
        var i:Int64 = 0
        for (item in 1..=7 : 2) {
           arr[i] = carr[item]
           i++
        } 
        Assert.fail()
    } catch (_) {
        Assert.pass()
    }

    0
}
