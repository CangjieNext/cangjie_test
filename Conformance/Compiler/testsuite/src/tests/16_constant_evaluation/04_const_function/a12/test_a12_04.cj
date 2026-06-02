
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a12_04

  @Level:         1

  @Assertion:   16.4(12) 9.For struct and class, const instance member functions can be defined only if const init is
                defined.
  @Description: Checks that const instance member functions cannot be defined in a generic class, which has only
                non-const init.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

class G<T> {
    const func f() { }

    init() { }
}

main() { }
