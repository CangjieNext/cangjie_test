/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a02_02

  @Level:         1

  @Assertion:       5.4(2) • Global functions 
                    A function that is declared at the top level is called a global function. Its scope is global, 
                    i.e., it is accessible globally. 

  @Description:     Check that function can't be declared on top-level.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

  @Issue:           6281

*/

func globalFunction(a: String): String  

main() {
}
