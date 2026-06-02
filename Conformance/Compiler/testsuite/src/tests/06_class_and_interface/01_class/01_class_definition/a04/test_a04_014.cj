/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a04_014

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
                Case: class with modifiers, type parameters, a superclass and an interface

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class prqifajlkv {}
interface fueUolkz {}

abstract qqe12f<nvak> <: prqifajlkv & fueUolkz {
  static var _fjkl3 = 1
  func urq02() {
    return 1
  }
}


main() {
}
