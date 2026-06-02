
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a06_05

  @Level:         1

  @Assertion:   16.4(6) 3.All expressions in const functions must be const expressions, except for the const init
                function.
  @Description: Checks that const instance member functions cannot have non-const expressions in their bodies.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

func g() { }

struct S {
    const f() { g() }

    const init() { }
}

main() { }
