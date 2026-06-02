/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_03_01_a01_08

  @Level:         1
  

  @Assertion:     5.1.3.1(1) In the Cangjie programming language, variables declared in a function body are called 
                  local variables. 

  @Description:   Check that local variables can't be accessed outside function:
                  access to local variable inside function from other function defined before.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
func func1() {
  var func1Var = func0Var
}

func func0() {
  var func0Var: Int32 = 22
  0
}

main() {
}
