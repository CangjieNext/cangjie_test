
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a05_03

  @Level:         1

  @Assertion:   16.4(5) const init function and const instance member function can access external variables declared
                by const in addition to const functions can access not only external variables declared by const, but
                also instance member variables of the current type.
  @Description: Checks that const init cannot access non-const external global `var` variables.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

var x = 0

struct S {
    const init() { x }
}

main() { }
