
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a17_11

  @Level:         1

  @Assertion:   4.23(17) This design helps to avoid mistakes where an assignment expression is mistakenly used as an
                equal expression. For instance, given the expression a = b = 0, the expression (a = b) is firstly
                evaluated and the value is (). Next, the expression () = 0 is evaluated. Since () cannot be an assigned
                to, an error is reported.
  @Description: Checks that a = b = 0 is invalid when a is Unit and b is integer since a = b is evaluated first.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    var a : Unit
    var b : Int64
    a = b = 0
    0
}

