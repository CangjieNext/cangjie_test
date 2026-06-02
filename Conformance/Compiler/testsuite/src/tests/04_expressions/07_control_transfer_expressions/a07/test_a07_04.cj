
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_a07_04

  @Level:         1

  @Assertion:   4.7(7) return must has its enclosing function body;
  @Description: Checks that return is not allowed inside the struct but outside the function body.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

struct S {
    var n = return
}

main() {
}
