
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a08_01

  @Level:         1

  @Assertion:   6.1.2.2(8) - For a generic class or struct, a static initializer is called guaranteed once per
                different type instantiation; 
  @Description: Checks that for a generic class or struct a static initializer is called once for every unique type
                instantiation if objects of that type are created.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert

var classCounter = 0
var structCounter = 0

class C<T> {
    static init() {
        classCounter++
    }
}

class S<T> {
    let c = C<T>()

    static init() {
        structCounter++
    }
}

main() {
    C<Int64>()
    C<Int16>()
    C<Int32>()
    C<Int64>()
    S<Rune>()
    S<Bool>()
    S<Rune>()
    S<Int32>()

    Assert.equals(1, classCounter)
    Assert.equals(1, structCounter)
}
