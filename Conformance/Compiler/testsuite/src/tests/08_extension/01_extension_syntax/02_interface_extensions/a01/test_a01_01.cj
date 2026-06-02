/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a01_01

  @Level:         1

  @Assertion:   8.1.2(1) Interface extensions can be used to add new functionality to
                existing types and implement interfaces, enhancing abstraction flexibility.

  @Description: Checks that interface extensions work as expected.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

interface I {
    func foo(): String
}

extend Bool <: I {
    public func foo(): String { "bool" }
}

extend Rune <: I {
    public func foo(): String { "char" }
}

extend String <: I {
    public func foo(): String { "string" }
}

extend Float32 <: I {
    public func foo(): String { "float" }
}

main() {
    Assert.equals("bool", true.foo())
    Assert.equals("char", r'S'.foo())
    Assert.equals("string", "Hello!".foo())
    Assert.equals("float", (5.3f32).foo())
    Assert.equals("string", """
\tline1
\tline2
\tline3
  """.foo())
}
