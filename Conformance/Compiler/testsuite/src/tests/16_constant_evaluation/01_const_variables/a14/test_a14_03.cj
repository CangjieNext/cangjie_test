
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a14_03

  @Level:         1

  @Assertion:   16.1(14) All members of an instance of this type are const after the const variable is initialized
                (deep const, members containing members), and therefore cannot be used for left values.
  @Description: Checks that member function cannot be assigned for a const class instance after its
                initialization.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

class C {
    func f() { }

    const init() { }
}

main() {
    const c = C()
    c.f = { => }
    return 0
}
