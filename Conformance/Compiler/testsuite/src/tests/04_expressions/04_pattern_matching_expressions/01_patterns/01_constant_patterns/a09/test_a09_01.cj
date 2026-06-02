/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a09_01

  @Level:         1

  @Assertion: 4.4.1.1(9) Byte string array literals cannot be used as patterns in pattern match expressions.

  @Description: Checks that using the Byte string array literal as pattern causes a compile error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    var v = b"Cangjie"
    match(v) {
        case b"Cangjie" => 1
        case _ => 0
    }
}
