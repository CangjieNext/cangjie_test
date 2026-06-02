/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_015

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

  @Description: Check that an interface with type parameters with constraints
                can not omit the interface name

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface<Ag0g, gZVnKoePj, `ZC6jZP`> where gZVnKoePj <: String {
    func pPL(): Array<(Int32) -> Array<(((Float32, Range<UInt8>)) 
    -> (Rune, Bool, Int8) -> String, () -> Array<Float32>, Bool, (Array<Rune>, String))>>
}

main() {
}