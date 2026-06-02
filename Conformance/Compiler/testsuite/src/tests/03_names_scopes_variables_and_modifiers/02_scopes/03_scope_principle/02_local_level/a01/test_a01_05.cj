/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a01_05

  @Level:         1

  @Assertion:    3.2.3.2(1) Names defined inside a function definition or an expression have local-level scope.

  @Description:  Checks that variable defined in nested function is not visible for the parent function scope.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

func f() {
  func nested() {
    var c = 44
  }
  c = 4
}

main() {

}
