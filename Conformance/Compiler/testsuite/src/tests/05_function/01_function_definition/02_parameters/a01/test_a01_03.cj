/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_a01_03

  @Level:         1

  @Assertion:     5.1.2(1) The sequence of parameters in the parameter list is as follows: 
                    non-named parameters, 
                    named parameter(including named parameter but no default values, and 
                    parameters with default values). 

  @Description:   Check that we can't use non-named parameter after named.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
func myFunc(a!: Int32, b: Rune) {
  "${a} ${b}"
}

main() {
}
