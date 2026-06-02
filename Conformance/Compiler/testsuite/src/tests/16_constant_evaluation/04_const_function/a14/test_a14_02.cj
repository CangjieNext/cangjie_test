
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a14_02

  @Level:         1

  @Assertion:   16.4(14) const instance member functions in struct cannot be mut.
  @Description: Checks that const instance member functions in generic struct cannot be mut.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

struct S<T> {
    mut const func f() { }

    const init() { }
}

main() { }
