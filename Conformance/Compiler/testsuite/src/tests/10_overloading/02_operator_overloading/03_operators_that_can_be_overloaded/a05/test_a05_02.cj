
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        10_02_03_a05_02

  @Level:         1

  @Assertion:   10.2.3(5) Operator  Description
                          **        Power: binary
  @Description: Checks that unary ** can be overloaded.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
*/

class C {
    operator func **() { }
}

main() { }
