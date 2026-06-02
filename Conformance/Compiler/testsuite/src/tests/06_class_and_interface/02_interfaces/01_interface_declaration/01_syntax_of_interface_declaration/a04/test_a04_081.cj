/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_081

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

  @Description: Check that an interface with modifiers and type parameters with constraints
                can not have two 'interface' keywords

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

public interface interface `TestA04081`<hPLn, `e`> where hPLn <: Unit {
    func `pKMc1TM`(): Rune
}

main() {
}