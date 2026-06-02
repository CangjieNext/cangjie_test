
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Comment:     This assertion is a part of the list with the heading
                "The following expressions are all const expressions."
  @Name:     16_02_a14_04

  @Level:         1

  @Assertion:   16.2(14) 11.const instance member function calls of const expressions, and all real parameters must be
                const expressions.
  @Description: Check that const instance member function calls of const expressions where some real parameters are
                non-const cannot be const expressions.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

func f() { 1 }

struct S {
    const init() { }

    const func f(x : Int64, y : Int64) { x + y }
}

main() {
    const s = S()
    const x = s.f(1, f())

    return 0
}
