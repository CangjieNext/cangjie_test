/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a04_016

  @Level:         1

  @Assertion: 6.1.1(4)
              The syntax of a class definition is as follows.
              classDefinition
                : classModifierList? 'class' identifier
                typeParameters?
                ('<:' superClassOrInterfaces)?
                genericConstraints?
                classBody
              ;
              superClassOrInterfaces
                : classType ('&' superInterfaces)?
                | superInterfaces
              ;

  @Description: Check that omitting the 'class' keyword causes an error.
                Case: class with modifiers, type parameters, interfaces and generic constraints

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface faGY {}
interface BDei {}
interface _fhKH3 {}

open vnnf39<O, A, C, W, Q> <: faGY & BDei & _fhKH3 where Q <: A & C, W <: O {
  static var _fjkl3 = 1
  func urq02() {
    return 1
  }
}


main() {
}
