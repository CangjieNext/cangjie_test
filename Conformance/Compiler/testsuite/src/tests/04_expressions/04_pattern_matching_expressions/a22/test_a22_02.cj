/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a22_02

  @Level:         1

  @Assertion: 4.4(22)  The compiler will try to do an exhaustive check, and if it cannot determine this,
              it will report an error and prompt for a case _.
  @Description: Checks that compiler will report an error and if compiler exhaustive check fails,
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

var r = 1

main() {
    var m = match (r) {
        case 0 => 1
        case 1 => 2
    }

    return
}
