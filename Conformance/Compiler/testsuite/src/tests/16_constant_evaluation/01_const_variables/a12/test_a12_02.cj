
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a12_02

  @Level:         1

  @Assertion:   16.1(12) const variables can access all instance members of the corresponding type, and can also call
                all non-mut instance member functions of the corresponding type.
  @Description: Checks that mut instance member functions cannot be accessed by a const variable.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

struct S {
    mut func f() { }

    const init() { }
} 

main() {
    const s = S()
    s.f()
}
