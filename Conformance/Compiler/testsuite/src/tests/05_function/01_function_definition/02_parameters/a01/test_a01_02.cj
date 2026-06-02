/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_a01_02

  @Level:         1

  @Assertion:     5.1.2(1) The sequence of parameters in the parameter list is as follows: 
                    non-named parameters, 
                    named parameter(including named parameter but no default values, and 
                    parameters with default values). 

  @Description:   Check that we can't set default value for non-named parameter.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
func myFunc(a: Int32, b: UInt16 = 7, c: Rune) {
  "${a} ${b} ${c}"
}

main() {
}
