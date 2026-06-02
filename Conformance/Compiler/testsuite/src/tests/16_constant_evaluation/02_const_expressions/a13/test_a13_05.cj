
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
  @Name:     16_02_a13_05

  @Level:         1

  @Assertion:   16.2(13) 10.this and super expressions in const init, or const functions.
  @Description: Check that a super expression in in a non-const member function cannot be a const expression.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

open class C {
    const init() { }
}

class D <: C {
    func f() {
        const c = super
    }
}

main() { }
