/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_03_a03_01

  @Level:         1

  @Assertion: 4.5.3(3)
              main(): Int64 {
                  var hundred = 0
                  do {
                      hundred++
                  } while (hundred < 100)
                  return 0
              }
  @Description: Check example code
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

main(): Int64 {
    var hundred = 0
    do {
        hundred++
    } while (hundred < 100)

    Assert.equals(100, hundred) // added

    return 0
}


