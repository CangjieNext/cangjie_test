
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a09_01

  @Level:         1

  @Assertion:   6.1.2.2(9) - Note that if there are no type instantiations of that class or struct, a static
                initializer wouldn’t be called at all;
  @Description: Checks that if a generic class or struct is not instantiated, then its static initializer is not
                called.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert

var classFlag = false
var structFlag = false

class C<T> {
    static init() { classFlag = true }
}

class S<T> {
    let c = C<T>()

    static init() { structFlag = true }
}

main() {
    Assert.isTrue(classFlag)
    Assert.isTrue(structFlag)
}
