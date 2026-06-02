
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a13_02

  @Level:         1

  @Assertion:   16.4(13) const instance member functions in class cannot be open.
  @Description: Checks that const instance member functions in abstract class cannot be open.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

abstract class A {
    open const func f() { }

    const init() { }
}

main() { }
