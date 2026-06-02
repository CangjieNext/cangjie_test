/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a04_137

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

  @Description: Check that several class types can not be inherited

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class Ujnqh {}
abstract class ozqRi {}
open class _ri8HK {}
abstract class Peqhfq {}

interface I1 {}
interface I2 {}
interface I3 {}

class Peqnb <: Ujnqh & ozqRi & _ri8HK & I1 & I2 & I3 & Peqhfq {}

main() {
}
