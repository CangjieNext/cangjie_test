
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a08_03

  @Level:         1

  @Assertion:   16.4(8) 5.There are no special rules for parameter types and return types in const functions. If the
                real parameter of the function call does not meet the const expression requirement, then the function
                call cannot be used as a const expression, but it can still be used as a normal expression.
  @Description: Checks that a const lambda function call is not a const expression if some of its real parameters are
                not const.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

class C() { }

main() {
    const f = { x: C, y: Int64 => }
    const c = f(C(), 1)
}
