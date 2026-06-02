/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_03_a06_03

  @Level:         1

  @Assertion: 4.4.1.3(6) The variable specified in the binding pattern have a scope from its first occurrence to
              the next case.

  @Description: Checks that an attempt to access the variable specified in the binding pattern outside of its case
                causes a compile error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    var v = 1
    var m = match (v) {
        case 0 => foo
        case foo => foo
        case _ => 0
    }
    return
}