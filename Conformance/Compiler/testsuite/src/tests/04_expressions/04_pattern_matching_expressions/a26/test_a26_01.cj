/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a26_01

  @Level:         1

  @Assertion: 4.4(26) If the least common super type does not exist, a compilation error is reported.
  @Description: Checks that compiler will report an error if branch types do not have common supertype.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

var r = 1;

main() {

    var m1 = match (r) {
        case 0 => 1
        case 1 => "2"
    }
    println(m1);

    return
}
