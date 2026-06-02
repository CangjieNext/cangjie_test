/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a03_03

  @Level:         1

  @Assertion:     5.1.2.2(3)
                  When defining a function, you must add ! to the end of the optional parameter name because optional 
                  parameters are a kind of named parameters. 
                  Otherwise, an error is reported during compilation. 
                  defaultParameter 
                    : identifier '!' ':' type '=' expression 
                    ; 


  @Description:   Check that missed : will produce an error.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func myFunc(k! String = "paramValue") {
  "${k}"
}
main() {
}
