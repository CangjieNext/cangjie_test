/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a03_02

  @Level:         1

  @Assertion: 4.4.1.6(3) The syntax of enum patterns is as follows.
              enumPattern
                  : (userType '.')? identifier enumPatternParameters?
                  ;
              enumPatternParameters
                  : '(' pattern (',' pattern)* ')'
                  ;

  @Description: Checks that the missing identifier causes a compilation error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
*/

enum E {
    | EE
}

main() {
    match(EE) {
        case E. => true
        case _ => false
    }

    return
}
