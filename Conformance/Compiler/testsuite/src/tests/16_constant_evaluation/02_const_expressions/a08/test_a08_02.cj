
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_02_a08_02

  @Level:         1

  @Assertion:   16.2(8) 6.enum constructor calls whose arguments are all const expressions, and enum constructors
                without parameters.
  @Description: Check that enum constructor calls, where some arguments are not const expressions, are not const
                expressions themselves.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

enum E {
    E1(Rune, Bool)
}

func c() { '1' }

main() {
    const c1 = E.E1(c(), true)
    return 0
}
