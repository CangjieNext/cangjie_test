/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_03_a07_02

  @Level:         1

  @Assertion: 4.4.1.3(7) Note that binding pattern is not allowed to be used in patterns connected by |, nor can they
              be nested in other patterns, otherwise a compiler error will be reported.

  @Description: Checks that using the binding pattern in patterns connected by | causes a compile error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    let v = 1
    match (v) {
        case foo | foo => 1
    }
    return
}
