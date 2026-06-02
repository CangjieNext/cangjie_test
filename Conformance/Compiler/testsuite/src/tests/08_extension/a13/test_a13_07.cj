/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a13_07

  @Level:         1

  @Assertion:   8(13) Extensions cannot override/redef original members.

  @Description: Checks that extensions of enum cannot redefine original members.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       


*/

enum Foo {
    | A 
    | B 
    | C
    
    static func foo(): Int64 { 0 }
}

extend Foo {
    redef static func foo(): Int64 { 1 }
}

main() { }
