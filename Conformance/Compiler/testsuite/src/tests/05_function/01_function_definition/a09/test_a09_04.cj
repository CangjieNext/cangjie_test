/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a09_04

  @Level:         1

  @Assertion:     5.1(9) The type of each parameter needs to be specified.

  @Description:   Check that usage parameters with type only (without name of parameter) is disallowed.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
func myFunc(:String):String {
  ""
}
main() {
}
