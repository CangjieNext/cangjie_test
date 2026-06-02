/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a12_01

  @Level:         1

  @Assertion:   8(12) Extensions cannot add open members.

  @Description: Checks that extensions of class cannot add open members.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       


*/

class Foo {
}

extend Foo {
    open func foo(): Int64 { 0 }
}

main() {
}
