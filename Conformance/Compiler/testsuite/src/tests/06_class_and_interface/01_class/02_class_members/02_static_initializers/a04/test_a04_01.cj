
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a04_01

  @Level:         1

  @Assertion:   6.1.2.2(4) There are following rules for a static initializer: - A static initializer is called
                automatically and couldn’t be called explicitly; 
  @Description: Checks that static initializer is called automatically.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert

var s = ""

class C {
    static init() { s += "C" }
}

class G<T> {
    static init() { s += "G" }
}

struct S {
    static init() { s += "S" }
}

var g1 = G<Int64>()

abstract class A {
    static init() { s += "A" }
}

var g2 = G<UInt64>()
var g3 = G<Int64>()

main() {
    Assert.equals("CGSA", s)
}
