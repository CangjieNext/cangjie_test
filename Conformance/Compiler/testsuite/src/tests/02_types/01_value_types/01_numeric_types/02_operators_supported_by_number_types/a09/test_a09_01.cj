/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_02_a09_01

  @Level:         1
  @Assertion:       2.1.1.2(9) The following are simple examples of bit operations on integers.
                        !10 // bitwise logical NOT operator: -11
                        10 << 1 // left shift operator: 10*2=20
                        10 >> 1 // right shift operator: 10/2=5
                        10 & 15 // bitwise logical AND operator: 10
                        10 ^ 15 // bitwise XOR operator: 5
                        10 | 15 // bitwise logical OR operator: 15
                        0b1010 & 0b1110 ^ 0b1111 | 0b0101 // result: 0b0101

  @Description:     Check that the Spec example works.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore
*/

import utils.assert.Assert

main() {
    !10 // bitwise logical NOT operator: -11
    10 << 1 // left shift operator: 10*2=20
    10 >> 1 // right shift operator: 10/2=5
    10 & 15 // bitwise logical AND operator: 10
    10 ^ 15 // bitwise XOR operator: 5
    10 | 15 // bitwise logical OR operator: 15
    0b1010 & 0b1110 ^ 0b1111 | 0b0101 // result: 0b0101

    Assert.equals(-11, !10)
    Assert.equals(10 * 2, 10 << 1)
    Assert.equals(10 / 2, 10 >> 1)
    Assert.equals(10, 10 & 15)
    Assert.equals(5, 10 ^ 15)
    Assert.equals(15, 10 | 15)
    Assert.equals(0b0101, 0b1010 & 0b1110 ^ 0b1111 | 0b0101)
}
