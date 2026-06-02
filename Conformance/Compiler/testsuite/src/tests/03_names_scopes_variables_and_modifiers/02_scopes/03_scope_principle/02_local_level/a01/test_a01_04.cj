/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a01_04

  @Level:         1

  @Assertion:    3.2.3.2(1) Names defined inside a function definition or an expression have local-level scope.

  @Description:  Checks that variable defined in function is not visible for the other function.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

func f1() {
  var a = 1
  return a
}

func f2() {
  a = 2
}

main() {

}
