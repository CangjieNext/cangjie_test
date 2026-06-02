/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a14_01

  @Level:         1

  @Assertion:       5.5(14)
                    sum1 = {a, b => a + b} 
                    sum2 = {a, b => return a + b}            // Same as that in the previous line.

  @Description:     Positive examples from spec

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

main() {
    var sum1 = {a: Int32, b: Int32 => a + b} 
    var sum2 = {a: Int32, b: Int32 => return a + b}            // Same as that in the previous line.

    Assert.equals(9, sum1(2, 7))
    Assert.equals(4, sum2(0, 4))
}
