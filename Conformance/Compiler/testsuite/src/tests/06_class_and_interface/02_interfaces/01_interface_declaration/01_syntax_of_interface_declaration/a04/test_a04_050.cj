/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_050

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

  @Description: Check that an interface with type parameters and inheritance
                can not have two interface names

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

public interface z {}
public interface `RRUzvcv` {}
public interface `czV1` {}
interface yOpM_O8 ym<zvs, `RBDUY0UY`, `g6iX`> <: z & `RRUzvcv` & `czV1` {
    func `FTp_`(): (String, Unit) -> Float16
}

main() {
}