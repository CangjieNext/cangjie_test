/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a07_02

  @Level:         1

  @Assertion:     5.1.2.2(7) Anonymous function lambda expression cannot have optional parameters. 

  @Description:   Check that optional parameter can't be used for lambda definition and invoking.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

main() {
  var sum1 = {a: Int64, b!: Int64 = 16 => a + b}(1, 2)
}
