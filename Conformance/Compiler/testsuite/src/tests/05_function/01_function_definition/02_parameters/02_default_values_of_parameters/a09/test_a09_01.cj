/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a09_01

  @Level:         1

  @Assertion:     5.1.2.2(9) Parameters and their default values of a function do not belong to the function’s body.

  @Description:   Check that the function used for parameter default value will be invocked from global scope, not 
                  from function body.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func a(x: Int64) { x + 1000 }
func b(x: Int64, y!: Int64 = a(x)) {
  func a(x: Int64) { x+x }
  Assert.equals(40,a(x))
  a(x+y)
}

main() {
  Assert.equals(1020, a(20))
  Assert.equals(2080, b(20))
}
