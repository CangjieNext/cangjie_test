/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a24_01

  @Level:         1

  @Assertion: 4.4(24) Similar to if expressions, the types of match expressions follow the following rules regardless
              whether they have selectors or not: When match expression is not read or returned, then the type of the
              match expression is Unit, and the branches’ types are not required to have common supertype;
  @Description: Checks that the reading of the match expression whose branches does not have common supertype causes a
                compile error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

var r = 0

main() {

    var m = match (r) {
        case 0 => 1
        case _ => "2"
    }

    println(m)

    return
}
