/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_04_a04_02

  @Level:         1

  @Assertion:     5.1.4(4) The return type of a function can be specified using the :Type syntax after the parameter 
                  lists of the function definition. In this case, the type of the function body and the type of e in 
                  return e expressions in the function body are required to be subtypes of the annotated type (i.e., 
                  Type), otherwise a compilation error is raised. 

  @Description:   Check that usage return expression with type different from function return type or its subtype will
                  poduce an error.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func myFunc(): Int64 {
  var myVar: Float32 = 12.3
  return myVar
}

main() {
}
