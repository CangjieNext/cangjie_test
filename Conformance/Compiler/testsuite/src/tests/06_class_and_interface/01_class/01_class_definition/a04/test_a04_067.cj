/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a04_067

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
                Case: class with type parameters and an interface

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface Pdhkeq631 {}

class _eqj<e98, Nd82, dq_e2ji, ea_1_> <: Pdhkeq631

main() {
}
