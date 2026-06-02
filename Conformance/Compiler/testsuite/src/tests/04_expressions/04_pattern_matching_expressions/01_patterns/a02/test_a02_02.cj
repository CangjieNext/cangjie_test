/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_a02_02

  @Level:         1

  @Assertion: 4.4.1(2) The syntax of patterns is defined as follows.
                pattern
                : constantPattern
                | wildcardPattern
                | varBindingPattern
                | tuplePattern
                | typePattern
                | enumPattern
                ;

  @Description: Checks that the pattern cannot be empty.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    let l1 = 1
    var m = match (l1) {
        case => 1
        case _ => 2
    }

    return
}
