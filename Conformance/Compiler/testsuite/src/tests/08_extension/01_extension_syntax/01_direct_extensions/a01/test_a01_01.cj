/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_01_a01_01

  @Level:         1

  @Assertion:   8.1.1(1) Direct extensions do not require declaring additional interfaces and
                can be used to add new functionality directly to existing types.

  @Description: Checks that direct extending of different types works as expected.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

extend Bool {
    func foo(): String { "bool" }
}

extend Rune {
    func foo(): String { "char" }
}

extend String {
    func foo(): String { "string" }
}

extend Float32 {
    func foo(): String { "float" }
}

main() {
    Assert.equals("bool", true.foo())
    Assert.equals("char", r'S'.foo())
    Assert.equals("string", "Hello!".foo())
    Assert.equals("float", 5.3.foo())
    Assert.equals("string", """
\tline1
\tline2
\tline3
  """.foo())
}
