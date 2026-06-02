/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a21_01

  @Level:         1

  @Assertion: 4.4(21)  Similarly, match expressions without selector are required to be exhaustive
              (i.e. at least one case is satisfied).
  @Description: Checks that the non-exhaustive match expressions without selector causes a compile error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

var r = 1

main() {
    match {
        case r > 0 => 0
        case r < 0 => 1
    }

    return
}
