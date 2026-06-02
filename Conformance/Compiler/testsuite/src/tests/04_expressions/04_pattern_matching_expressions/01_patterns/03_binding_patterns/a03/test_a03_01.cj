/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_03_a03_01

  @Level:         1

  @Assertion: 4.4.1.3(3) The syntax of binding patterns is as follows.
              varBindingPattern
                  : identifier
                  ;

  @Description: Validates compilation of some examples illustrating the syntax definition above.
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

main() {
    var v = 123
    match (v) {
        case foo => 1
    }
    match (v) {
        case a => a
    }
    match (v) {
        case a where v is Int32 => a
        case a => a + a
    }
    return
}
