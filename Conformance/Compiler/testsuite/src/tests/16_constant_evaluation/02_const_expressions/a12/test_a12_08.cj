
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Comment:     This assertion is a part of the list with the heading
                "The following expressions are all const expressions"
  @Name:     16_02_a12_08

  @Level:         1

  @Assertion:   16.2(12) 9.member access of const expressions (excluding access of properties), access of elements for
                tuples.
  @Description: Check that mutable property getter access of const expressions cannot be a const expression.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6124, 6614

*/

struct S {
    mut prop p: Int64 {
        get() { 1 }
        set() { }
    }

    const init() { }
}

main() {
    const s = S()
    const c = s.p
    return 0
}
