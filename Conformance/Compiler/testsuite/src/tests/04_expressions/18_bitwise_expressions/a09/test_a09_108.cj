
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a09_108

  @Level:         1

  @Assertion:   4.18(9) Furthermore, the operand right of the operator must not be a negative number. Otherwise, a
                compilation error will be reported if it is detected at compile time, or an ArithmeticException is
                thrown at run-time.
  @Description: Checks that compilation fails when the right operand of >> is a negative number for types UInt16
                and Int16.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    var v1 : UInt16 = 1
    var v2 : Int16 = -1
    let v3 = v1 >> v2
}
