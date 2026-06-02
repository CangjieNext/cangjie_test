/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_02_a03_01

  @Level:         1

  @Assertion: 4.4.1.2(3) The syntax of the wildcard pattern is as follows.
              wildcardPattern
                  : '_'
                  ;

  @Description: Validates compilation of some examples illustrating the syntax definition above.
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

main() {
    var l1: Int64 = 1
    var m = match (l1) {
        case _ => true
    }

    m = match (l1) {
        case _ where m is Unit => false
        case _ => true
    }
}
