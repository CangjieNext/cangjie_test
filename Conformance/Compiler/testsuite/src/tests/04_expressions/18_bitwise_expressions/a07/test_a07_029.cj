
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a07_029

  @Level:         1

  @Assertion:   4.18(7) The operands of bitwise left/right shift operator must be of type integer.
  @Description: Checks that using operator << with types String and Float16 is not permitted.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    var v1 : String = "1"
    var v2 : Float16 = 1.0
    let v3 = v1 << v2
}
