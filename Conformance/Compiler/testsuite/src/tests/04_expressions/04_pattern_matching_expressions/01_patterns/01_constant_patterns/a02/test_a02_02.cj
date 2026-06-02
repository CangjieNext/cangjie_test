/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a02_02

  @Level:         1

  @Assertion: 4.4.1.1(2) The literal in the constant pattern needs to be of the same type as selector.

  @Description: Checks match expression with constant patterns of different types causes a compile error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

var v = 1

main() {
    var m = match (v) {
        case 1 => 1
        case "a" => 2
        case 'a' | 5 => 3
        case _ => 4
    }

    return
}
