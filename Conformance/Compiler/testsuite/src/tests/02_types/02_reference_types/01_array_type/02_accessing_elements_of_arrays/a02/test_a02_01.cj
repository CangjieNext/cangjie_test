/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_02_a02_01

  @Level:         1
  @Assertion:    2.2.1.2(2) For example:
    let array5 = [0, 1]
    let element0 = array5[0] // element0 = 0
    array5[1] = 10 // change the value of the second element of 'array5'
                   // through index
    let array6 = [[0.1, 0.2], [0.3, 0.4]]
    let element01 = array6[0][1] // element01 = 0.2
    array6[1][1] = 4.0 // change the value of the last element of 'array6'
                   // through index

  @Description:  Checks that example from the spec works

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/
import utils.assert.*

main(): Int64 {
    let array5 = [0, 1]
    let element0 = array5[0] // element0 = 0
    array5[1] = 10 // change the value of the second element of 'array5'
                   // through index
    let array6 = [[0.1, 0.2], [0.3, 0.4]]
    let element01 = array6[0][1] // element01 = 0.2
    array6[1][1] = 4.0 // change the value of the last element of 'array6'
                       // through index

    Assert.equals(0, element0)
    Assert.equals(10, array5[1])
    Assert.equals(0.2, element01)
    Assert.equals(4.0, array6[1][1])
    return 0
}
