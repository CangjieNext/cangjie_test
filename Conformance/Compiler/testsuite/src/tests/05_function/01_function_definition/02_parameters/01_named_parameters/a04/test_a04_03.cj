/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_01_a04_03

  @Level:         1

  @Assertion:     5.1.2.1(4) If a parameter is a named parameter, you need to specify the parameter name with the 
                  prefix parameter name: before the argument value when calling the function. Otherwise, an error 
                  is reported during compilation.  

  @Description:   Check that function call with parameter name for non-named parameter will produce an error.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func myFuncWithNonNamedAndNamed(a: Int32, b!: UInt16) {
  "${a} ${b}"
}
main() {
  print("${myFuncWithNonNamedAndNamed(a:12,b:6)}")
}
