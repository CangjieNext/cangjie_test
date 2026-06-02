/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a04_081

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

  @Description: Check that the order of the components of the class definition can not be switched
                Case: superclass can not be placed after the class body

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class jklUE8 {}

class _eiur842 {} <: jklUE8

main() {
}
