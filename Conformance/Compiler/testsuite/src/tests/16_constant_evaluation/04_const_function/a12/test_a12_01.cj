
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a12_01

  @Level:         1

  @Assertion:   16.4(12) 9.For struct and class, const instance member functions can be defined only if const init is
                defined.
  @Description: Checks defining and using const instance member functions in struct and class.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

abstract class A {
    const func f() { 1 }

    const init() { }
}

class C <: A {
    const func g() { 2 }

    const init() { }
}

class G<T> {
    const static func f() { 3 }

    const init() { }
}

struct S {
    const func f() { 4 }

    const init() { }
}

main() {
    Assert.equals(1, C().f())
    Assert.equals(2, C().g())
    Assert.equals(3, G<String>.f())
    Assert.equals(4, S().f())
}
