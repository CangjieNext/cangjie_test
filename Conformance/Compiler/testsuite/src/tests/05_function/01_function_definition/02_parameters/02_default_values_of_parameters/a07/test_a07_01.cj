/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a07_01

  @Level:         1

  @Assertion:     5.1.2.2(7) Anonymous function lambda expression cannot have optional parameters. 

  @Description:   Check that optional parameter can't be used for lambda definition.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

main() {
  var lambda1:  = {a: Int64, b!: Int64 = 12 => a + b}
}
