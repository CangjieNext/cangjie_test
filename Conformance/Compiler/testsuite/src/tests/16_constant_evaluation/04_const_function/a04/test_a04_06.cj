
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a04_06

  @Level:         1

  @Assertion:   16.4(4) 2.The global const function and the static const function can only access external variables
                declared by const, including const global variables and const static member variables, but no other
                external variables.
  @Description: Checks that the static const function cannot access external non-const global `let` variables.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

let x = 0

struct S {
    static const func f() { x }
}


main() { }
