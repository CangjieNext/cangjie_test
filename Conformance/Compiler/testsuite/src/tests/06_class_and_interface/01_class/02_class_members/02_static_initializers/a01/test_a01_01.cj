
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a01_01

  @Level:         1

  @Assertion:   6.1.2.2(1) Static variables in a class or struct can also be initialized in a static initializer by
                assignment expression.
  @Description: Checks initialization of variables in classes and structures in a static initializer by assignment
                expression.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert

class C {
    static var x : Int64

    static init() { x = 1 }
}

class G<T> {
    static var x : Int64

    static init() { x = 1 }
}

struct S {
    static var x : Int64

    static init() { x = 1 }
}

abstract class A {
    static var x : Int64

    static init() { x = 1 }
}

main() {
    Assert.equals(1, C.x)
    Assert.equals(1, S.x)
    Assert.equals(1, G<String>.x)
    Assert.equals(1, A.x)
}
