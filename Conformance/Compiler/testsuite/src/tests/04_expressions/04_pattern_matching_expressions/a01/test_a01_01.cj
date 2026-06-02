/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a01_01

  @Level:         1

  @Assertion: 4.4(1) With match expressions, the Cangjie programming language
              supports a powerful pattern matching mechanism that facilitates
              concise syntax for achieving complex control flow.
  @Description: Checks compilation of a program with match expression.
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

main() {
    let l1 = 1;
    println(
        match (l1) {
            case 1 => "one"
            case _ => "fail"
        }
    )

    return
}
