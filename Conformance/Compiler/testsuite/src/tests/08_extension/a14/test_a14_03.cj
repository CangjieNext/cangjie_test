/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a14_03

  @Level:         1

  @Assertion:   8(14) Extensions cannot access private members of the original type.

  @Description: Checks that extensions of enum cannot access private members of the original type.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       


*/

enum Foo {
    | A 
    | B 
    | C

    private prop x: Int64 {
        get() { 0 }
    }
}

extend Foo {
    func foo(): Int64 { this.x }
}

main() { }
