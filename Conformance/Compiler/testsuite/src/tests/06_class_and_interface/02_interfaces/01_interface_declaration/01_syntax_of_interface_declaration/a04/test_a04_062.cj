/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_062

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
                can not have two superinterface lists

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

public interface RQlxqhcHv {}
public interface `X` {}
public interface nELHVYMpqM {}
public interface SSwgh {}
public interface vba {}
interface K1oStX<`DYGN95uN`, `uMnAFg`, e, `fFjQtfY5vc`> 
<: RQlxqhcHv & `X` <: nELHVYMpqM & SSwgh & vba where `DYGN95uN` <: `uMnAFg` & e {
    func dEQ(): ((Float32, Array<Rune>), Rune) -> Range<UInt64>
}

main() {
}