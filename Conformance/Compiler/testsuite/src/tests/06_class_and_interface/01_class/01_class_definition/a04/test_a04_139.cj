/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a04_139

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
                Case: a list of several supertypes without any separators

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class PQRjo {}

interface fwpq {}
interface EQEIUQ {}
interface FQW_qj29H {}
interface JLeq {}

class __dqh <: PQRjo fwpq EQEIUQ FQW_qj29H JLeq {}

main() {
}
