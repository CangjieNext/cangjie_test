/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a04_065

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

  @Description: Check that omitting the body causes an error.
                Case: class with modifiers, type parameters, a superclass, interfaces and generic constraints

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class P3180 {}
interface Nd129 {}
interface _fhk2 {}

abstract class Oeqb<poq_, jdoqrh, QOeqka, pqr_qj, fhqkueq> <: P3180 & Nd129 & _fhk2 where jdoqrh <: fhqkueq

main() {
}
