
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a04_03

  @Level:         1

  @Assertion:   16.4(4) 2.The global const function and the static const function can only access external variables
                declared by const, including const global variables and const static member variables, but no other
                external variables.
  @Description: Checks that the global const function cannot access external non-const global `var` variables.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

var x = 0

const func f() { x }

main() { }
