
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a07_04

  @Level:         1

  @Assertion:   16.4(7) 4.let and const can be used in const functions to declare new local variables. But var is not
                supported.
  @Description: Checks that var cannot be used in static member const functions to declare new local variables.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

struct S {
    static const func f() {
        var x = 0
    }
}

main() { }
