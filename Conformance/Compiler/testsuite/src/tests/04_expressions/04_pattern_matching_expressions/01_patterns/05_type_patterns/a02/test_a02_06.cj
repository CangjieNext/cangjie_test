/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_05_a02_06

  @Level:         1

  @Assertion: 4.4.1.5(2) The syntax of type patterns is as follows.
              typePattern
                  : (wildcardPattern | varBindingPattern) ':' type
                  ;

  @Description: Checks that the missing : beetween the varBindingPattern pattern and the type causes a compilation
                error.

  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    match (10i32) {
        case foo Int32 => true
        case _ => false
    }
    return
}
