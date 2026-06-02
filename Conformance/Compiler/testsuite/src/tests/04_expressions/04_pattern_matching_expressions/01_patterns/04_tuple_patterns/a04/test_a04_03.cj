/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_04_a04_03

  @Level:         1

  @Assertion: 4.4.1.4(4) The number of patterns in the tuple pattern needs to be of the same as the dimension of
              the selector.

  @Description: Checks that tuple pattern with the dimension different from the selector dimension causes a compile
                error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    var v1 = (1, 2, 3)
    match (v1) {
        case (1, 2) => true
        case _ => false
    }
    return
}
