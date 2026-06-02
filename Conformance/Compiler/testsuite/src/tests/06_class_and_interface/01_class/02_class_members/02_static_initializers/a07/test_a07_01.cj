
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a07_01

  @Level:         1

  @Assertion:   6.1.2.2(7) - For a non-generic class or struct, a static initializer is called guaranteed once;
  @Description: Checks that static initializer is called once for a non-generic class or struct when its instance is
                not created.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert

var classFlag = true
var structFlag = true
var abstractClassFlag = true

abstract class A {
    static init() {
        Assert.isTrue(abstractClassFlag)
        abstractClassFlag = false
    }

    A() { Assert.isFalse(abstractClassFlag) }

    init(x : Int64) { Assert.isFalse(abstractClassFlag) }
}

class C <: A {
    static init() {
        Assert.isTrue(classFlag)
        classFlag = false
    }

    C() { Assert.isFalse(classFlag) }

    init(x : Int64) { Assert.isFalse(classFlag) }
}

struct S {
    static init() {
        Assert.isTrue(structFlag)
        structFlag = false
    }

    S() { Assert.isFalse(structFlag) }

    init(x : Int64) { Assert.isFalse(structFlag) }
}

main() {
    Assert.isFalse(abstractClassFlag)
    Assert.isFalse(classFlag)
    Assert.isFalse(structFlag)
}
