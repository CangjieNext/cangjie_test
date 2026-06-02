/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_089

  @Level:         1

  @Assertion: 6.2.1.1(4)
              The syntax of interface declaration is as follows.
              interfaceDefinition
                : interfaceModifierList? 'interface' identifier
                typeParameters?
                ('<:' superInterfaces)?
                genericConstraints?
                interfaceBody
                ;

  @Description: Check that an interface with modifiers, type parameters with constraints and inheritance
                can not have two superinterface lists

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

public interface `FzQ_0` {}
public interface fdu {}
public interface pBxcD {}
public interface fd42UKz2 {}
public interface GOubqWwi<`m0pA`> <: `FzQ_0` <: fdu & pBxcD & fd42UKz2 where `m0pA` <: Rune {
    func `I`(): Unit
}

main() {
}