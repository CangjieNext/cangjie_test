/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_03_a08_02

  @Level:         1

  @Assertion: 4.4.1.3(8)
              let opt = Some(0) match (opt) {
                  case x | x => {} // error: variable cannot be introduced in patterns connected by '|'
                  case Some(x) | Some(x) => {} // error: variable cannot be introduced in patterns connected by '|'
                  case x: Int64 | x: String => {} // error: variable cannot be introduced in patterns connected by '|'
              }

  @Description: Checks that compilation of the negative example causes a compile error.
                Negative examples from spec: case 2.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    let opt = Some(0)
    match (opt) {
        case Some(x) | Some(x) => {} // error: variable cannot be introduced in patterns connected by '|'
    }
}
