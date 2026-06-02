/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_076

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
                can not have two 'interface' keywords

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

public interface `NFVjj0` {}
public interface `KONS3v45B` {}
public interface `Tq6Y` {}
interface interface `gk`<`EpXm4JX`, `SW`> <: `NFVjj0` & `KONS3v45B` & `Tq6Y` {
    func njv3(): (Bool) -> (Array<(((() -> Int8, String), (Float32, String, Float16) 
    -> (Int8, Array<(Rune, Int32, Rune)>) -> (Rune, Range<UInt32>)), Unit) -> Range<UInt32>>,
    () -> Range<UInt16>, String, (Unit, String) -> (Range<UInt16>, Rune, String, Float16))
}

main() {
}