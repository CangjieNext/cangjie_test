/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a14_01

  @Level:         1

  @Assertion:   8(14) Extensions cannot access private members of the original type.

  @Description: Checks that extensions of class cannot access private members of the original type.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       


*/

class Foo {
    private var x: Int64 = 0
}

extend Foo {
    func foo(): Int64 { x }
}

main() { }
