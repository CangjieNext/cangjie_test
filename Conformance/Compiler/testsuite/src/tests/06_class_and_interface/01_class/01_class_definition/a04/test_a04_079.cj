/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a04_079

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
                Case: the class body can not be placed before interfaces and generic constraints

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface Ocnfa_2 {}

class Idcnldq<Iueq, Peq> {} <: Ocnfa_2 where Iueq <: Peq

main() {
}
