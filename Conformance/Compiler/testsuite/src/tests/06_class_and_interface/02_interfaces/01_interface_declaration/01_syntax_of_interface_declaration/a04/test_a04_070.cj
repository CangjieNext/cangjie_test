/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_070

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

  @Description: Check that an interface with modifiers and inheritance
                can not have two superinterface lists

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

public interface Q7HCo16xp {}
public interface `EuT3uR` {}
public interface TwyFv {}
interface b <: Q7HCo16xp & `EuT3uR` <: TwyFv {
    func `vB6w7n`(): Float64
}

main() {
}