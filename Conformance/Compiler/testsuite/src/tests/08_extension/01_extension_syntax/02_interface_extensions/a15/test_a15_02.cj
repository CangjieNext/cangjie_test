/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         08_01_02_a15_02

  @Level:         1

  @Assertion:    8.1.2(15) The definition of orphan extensions is prohibited. Orphan extensions
                 refer to interface extensions that are neither defined in the same package as
                 the interface (containing all interfaces in the interface inheritance chain)
                 nor in the same package as the type being extended.

  @Description:  Checks that interface extension can be defined with type being extended. 

  @Mode:         compileonly
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: aux_test_a15_02.cj


*/

import p2.AuxTestA1502

class Foo {}

extend Foo <: AuxTestA1502 {
    public func foo(): Int64 { 99 }
}

main() { }
