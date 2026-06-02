
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a01_04

  @Level:         1

  @Assertion:   16.1(1) A const variable is a special variable that is evaluated at compile time and cannot be changed
                at runtime.
  @Description: Checks that the value of a static member const variable cannot be changed at runtime.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

class C {
    static const a = 0
}

main() {
    C.a = 1
}
