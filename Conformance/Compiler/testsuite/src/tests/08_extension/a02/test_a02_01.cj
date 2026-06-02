/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a02_01

  @Level:         1

  @Assertion:   8(2) Features that can be added include: Adding Instance Member Functions.

  @Description: Checks that instance member function can be added to class extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

class Foo {
    var p: Int64 = 0

    func getP() { p }
}

extend Foo {
    func setP(v: Int64) { p = v }
}

main() {
    let x = Foo()
    x.setP(111)
    Assert.equals(111, x.getP())
}
