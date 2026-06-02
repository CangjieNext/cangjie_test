
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a08_02

  @Level:         1

  @Assertion:   6.1.2.2(8) - For a generic class or struct, a static initializer is called guaranteed once per
                different type instantiation; 
  @Description: Checks that for a generic class or struct a static initializer is called once for every unique type
                instantiation even when object of that type are not created.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert

var staticInitCounter = 0

class A<T> {
    static init() {
        staticInitCounter++
    }
}

class Tester<T> { }

main(): Unit {
    Assert.equals(1, staticInitCounter)
    Tester<A<Bool>>()
    Tester<A<Rune>>()
}
