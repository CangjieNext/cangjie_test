/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_04_a01_03

  @Level:         1

  @Assertion: 4.4.1.4(1) Tuple patterns are used to match tuples.

  @Description: Checks that the tuple can not be used to match string

  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    var v1: String = "1"
    match(v1) {
        case ("1", "1") => true
        case _ => false
    }
    return
}
