/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_011

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
                can not omit the 'interface' keyword

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

public interface `tqOIAF` {}
public interface S {}
public interface kNNrhkP {}
`X`<`mGLOUXdZ`, `dDM5jKKd`> <: `tqOIAF` & S & kNNrhkP {
    func `gTaveJ`(): Array<Unit>
}

main() {
}