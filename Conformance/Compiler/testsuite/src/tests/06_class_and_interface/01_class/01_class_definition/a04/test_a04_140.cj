/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a04_140

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

  @Description: Check that the '&' symbol can not be ommited as a separator in the supertype list
                Case: a list of several supertypes with only one separator missing

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class EPQoen {}

interface eqio90 {}
interface JFrj28j_ {}
interface j28 {}
interface fj48 {}

class Ioqjf <: EPQoen & eqio90 & JFrj28j_ j28 & fj48 {}

main() {
}
