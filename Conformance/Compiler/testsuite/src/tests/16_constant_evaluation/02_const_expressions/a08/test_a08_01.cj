
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_02_a08_01

  @Level:         1

  @Assertion:   16.2(8) 6.enum constructor calls whose arguments are all const expressions, and enum constructors
                without parameters.
  @Description: Check that enum constructor calls whose arguments are all const expressions, and enum constructors
                without parameters are const expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

class C {
    const init() { }
}

struct S {
    const init() { }
}

enum E {
    E1 |
    E2(Int64) |
    E3(Rune, Bool) |
    E4(C, S) |
    ...
}

main() {
    const c1 = E.E1
    const c2 = E.E2(1)
    const c3 = E.E3(r'1', true)
    const c4 = E.E4(C(), S())
    return 0
}
