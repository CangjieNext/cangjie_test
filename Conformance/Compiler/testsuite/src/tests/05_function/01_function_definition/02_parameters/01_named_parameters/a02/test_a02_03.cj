/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_01_a02_03

  @Level:         1

  @Assertion:     5.1.2.1(2) When the function is declared, non-named parameters must precede all named parameters.

  @Description:   Check that wrong order of non-named and named parameters will produce an error:
                  named between non-named.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

  @Issue:         6180

  @Comment:      To avoid misunderstanding, you need to add " (if exists)" after "non-named parameters "

*/

func myFuncWithNonNamedAndNamed(a: Int32, b!: UInt16, c: Bool) {
  "${a} ${b} ${c}"
}

main() {
}
