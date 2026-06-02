/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_080

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

  @Description: Check that an interface with modifiers, type parameters and inheritance
                can not have two bodies

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

public interface Vsl {}
public interface xEvYE89Oz {}
public interface hXj7zDWW69 {}
public interface sCso0S<Sh935FfS1, HiVi6HA, zZRv> <: Vsl & xEvYE89Oz & hXj7zDWW69 {
    func Yk0_(): Bool
} {
    func V(): Array<(Bool, Rune) -> (Rune, String, Bool)>
}

main() {
}