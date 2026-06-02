/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a03_03

  @Level:         1

  @Assertion: 4.4.1.6(3) The syntax of enum patterns is as follows.
              enumPattern
                  : (userType '.')? identifier enumPatternParameters?
                  ;
              enumPatternParameters
                  : '(' pattern (',' pattern)* ')'
                  ;

  @Description: Checks that the missing parameters in the enumPatternParameters causes a compilation error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
*/

enum E {
    | EE(Int64, Int64)
}

main() {
    match(EE(1, 2)) {
        case EE => true
        case _ => false
    }

    return
}
