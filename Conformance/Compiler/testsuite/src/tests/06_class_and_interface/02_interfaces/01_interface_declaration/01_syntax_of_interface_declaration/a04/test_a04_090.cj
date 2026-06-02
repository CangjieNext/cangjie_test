/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_090

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
                can not have two sets of constraints

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

public interface eQSFiB {}
public interface mb5W {}
public interface `I8` {}
public interface `Z`<Pl3U> <: eQSFiB & mb5W & `I8` where Pl3U <: Float16 where Pl3U <: Int64 {
    func Pc8fm2aG4(): Rune
}

main() {
}