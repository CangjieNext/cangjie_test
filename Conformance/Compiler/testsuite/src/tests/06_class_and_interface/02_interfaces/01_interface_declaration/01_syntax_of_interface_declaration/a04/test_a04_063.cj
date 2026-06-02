/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_063

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
                can not have two sets of constraints

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

public interface `GLz` {}
public interface `JzABOcx` {}
public interface `n` {}
interface s<W, `kik6gUsOZ9`, u, `XDImG7`> 
<: `GLz` & `JzABOcx` & `n` where W <: String where W <: `kik6gUsOZ9`, u <: Float16 {
    func CiJms(): String
}

main() {
}