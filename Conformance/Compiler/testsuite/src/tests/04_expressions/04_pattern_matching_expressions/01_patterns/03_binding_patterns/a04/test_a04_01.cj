/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_03_a04_01

  @Level:         1

  @Assertion: 4.4.1.3(4) The variable specified in the binding pattern is immutable.

  @Description: Checks that an attempt to assign value to the variable specified in the binding pattern causes
                a compile errorr.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    var v = 123
    match (v) {
        case foo => foo = 1
    }
    return
}
