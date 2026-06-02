/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_a08_01

  @Level:         1

  @Assertion:   8.1(8) Direct extensions do not require declaring additional interfaces.

  @Description: Checks direct extensions.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

class A {
}

extend A {
    func foo(): String { "A" }
}

struct S {
}

extend S {
    func foo(): String { "S" }
}

extend<T> Range<T> {
    func foo(): String { "Range" }
}

extend<T> Array<T> {
    func foo(): String { "Array" }
}

main() {
    Assert.equals("A", A().foo())
    Assert.equals("S", S().foo())
    Assert.equals("Range", (1..2).foo())
    Assert.equals("Array", [1, 2, 3].foo())
}
