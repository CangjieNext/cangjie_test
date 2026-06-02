/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a07_03

  @Level:         1

  @Assertion: 4.4.1.6(7) Note that matching enum requires that the type of the enum pattern is the same as the type of
              the selector, and that the compiler checks to see if each constructor of the enum type (including the
              value of the constructor’s argument) is fully covered, otherwise the compiler will report an error.

  @Description: Checks that the compiler will report an error if not each constructor with parameterns of the enum type
                is fully covered.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

enum E {
    | A(Int64)
    | B(Int64, Int64)
}

main() {
    match(B(1, 2)) {
        case B(1, 2) => true
        case A(_) => true
    }

    return
}
