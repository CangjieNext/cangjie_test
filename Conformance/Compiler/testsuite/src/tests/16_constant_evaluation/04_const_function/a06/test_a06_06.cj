
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a06_06

  @Level:         1

  @Assertion:   16.4(6) 3.All expressions in const functions must be const expressions, except for the const init
                function.
  @Description: Checks that const init cannot have non-const expressions, which are not assignments of instance member
                variables.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

func g() { }

struct S {
    const init() { g() }
}

main() { }
