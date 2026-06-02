/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a24_01

  @Level:         1

  @Assertion:    3.2.3.2(24) For for-in expressions, their loop bodies can refer to the names 
                 of variables introduced in the loop condition.

  @Description:  Checks that the for-in loop body can refer to the loop condition item.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
    let arr : Array<Int64> = [0, 1]
    var ind : Int64 = 0
    for (num in arr) {
        print(num)
        Assert.equals(num, arr[ind])
        ind++
    }
}