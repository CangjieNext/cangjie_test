/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_064

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

  @Description: Check that an interface with type parameters with constraints and inheritance
                can not have two bodies

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

public interface TestA04064 {}
interface mvCL6SMRJ1<`B`, `TAzua4bb`> <: TestA04064 where `B` <: `TAzua4bb` {
    func `w0iLleGTB`(): Range<Int64>
} {
    func `eNf34`(): Array<Int16>
}

main() {
}