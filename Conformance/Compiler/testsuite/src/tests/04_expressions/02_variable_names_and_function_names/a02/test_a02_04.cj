/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_02_a02_04

  @Level:         1

  @Assertion: 4.2(2) For a variable name, its value is the value of the 
              variable after it has been evaluated, and its type is the type
              of the variable. 
  @Description: Checks that compile error appears when trying to get the 
                unmutable variable value which has not beed evaluated yet. 
                Tests case when variable type is specified.
  @Mode: compileonly
  @Negative: yes
  @Structure: single

*/

main() {
    let str: String
    str
    return
}
