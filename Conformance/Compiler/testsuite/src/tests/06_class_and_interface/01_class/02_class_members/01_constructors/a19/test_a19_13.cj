/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a19_13

  @Level:         1

  @Assertion: 6.1.2.1(19)
              The initial value expression can refer to other parameters that have been defined before the parameter
              (excluding instance member variables defined outside the primary constructor),
              but the values of these referred parameters and member variables cannot be modified

  @Description: Check that the initial value of a var member variable parameter
                can not refer to itself

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @CompileWarning: ignore

*/

class A {
  A(
    var x!: Int64 = x
  ) {}
}

main() {
}