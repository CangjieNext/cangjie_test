/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_055

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
                can not have two interface names

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface `tGoLfiK` YdE<`z`, ODsRAs26Bb, `pP`> where `z` <: Bool {
    func `SoIT_`(): Array<((Range<Int8>, Unit, Unit, 
    (Float16, (Range<UInt64>, Rune, Bool, Float32), String, ((String) 
    -> Array<Range<UInt64>>, Array<(Array<(UInt8, Bool)>, UInt32, Unit)>)))) -> UInt64>
}

main() {
}