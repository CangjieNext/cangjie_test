/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_086

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
                can not have two 'interface' keywords

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

public interface `vfaa` {}
public interface `k6` {}
public interface interface `oX7uIXYVb`<UICLo, dww, dof> <: `vfaa` & `k6` where dof <: Rune {
    func kFUbs9Gel(): (String, String) -> Array<Rune>
}

main() {
}