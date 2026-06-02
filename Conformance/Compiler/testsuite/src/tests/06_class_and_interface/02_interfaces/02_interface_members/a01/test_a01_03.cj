/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_a01_03

  @Level:         1

  @Assertion: 6.2.2(1)
              The members of an interface include
              • members declared in the body of the interface which include static member functions,
                instance member functions, operator overloading functions,
                static member properties and instance member properties.
              • and members inherited from other interfaces.

  @Description: Check that a global variable is not a member of an interface

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

var x = 1

interface I {}

class A <: I {}

main() {
    A().x
}