/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_052

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
                can not have two superinterface lists

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

public interface m3 {}
public interface `b3UD7ISZ` {}
public interface wfjW6KQ {}
public interface `KmDQ` {}
interface N<lN4MWiHI> <: m3 <: `b3UD7ISZ` & wfjW6KQ & `KmDQ` {
    func h5p(): Array<Array<Int16>>
}

main() {
}