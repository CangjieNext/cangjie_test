/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a04_064

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
                Case: class with modifiers, type parameters, interfaces and generic constraints

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface urq_YRo {}
interface f20fI1 {}
interface fbni {}

open class Pfza<mnUe1, fhj31941, rqfhRq, Ndqo, Pofzm> <: urq_YRo & f20fI1 & fbni where Pofzm <: fhj31941 & rqfhRq, Ndqo <: mnUe1

main() {
}
