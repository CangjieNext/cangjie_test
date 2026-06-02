
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_03_a02_03

  @Level:         1

  @Assertion:   4.7.3(2) It can only be used in a function body.
  @Description: Checks that return is not allowed inside the class but outside the function body.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

class C {
    var n = return
}

main() {
}
