/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_04_a06_06

  @Level:         1

  @Assertion: 4.4.1.4(6) The syntax of the tuple pattern is as follows.
              tuplePattern
                  : '(' pattern (',' pattern)+ ')'
                  ;

  @Description: Checks that missing required the second pattern causes a compilation error.

  @Mode: compileonly
  @Negative: yes
  @CompileWarning: no

*/

main() {
    match ((1, 2)) {
        case (1) => true
        case _ => false
    }

    return
}