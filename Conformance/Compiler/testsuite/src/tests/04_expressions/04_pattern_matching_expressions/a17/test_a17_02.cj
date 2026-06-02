/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a17_02

  @Level:         1

  @Assertion: 4.4(17) For match expressions without selector, there is no expression after the keyword match, and
              for each case in {}, there can only be one expression of type Bool between the keyword case and =>
              (or the wildcard _, which means always true).
  @Description: Checks that multiple expression of type Bool between the keyword case and => in matching expressions
                without selector causes a compile error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

var expr = 1

main() {
    let b: Bool = true
    var m = match {
        case expr == 0 b => 1
        case _ => 2
    }

    return
}
