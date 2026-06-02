/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         08_01_02_a18_01

  @Level:         1

  @Assertion:    8.1.2(18) Interface extensions for all other cases are not allowed to be defined.

  @Description:  Checks that interface extension cannot be defined in the package other than type
                 definition package or interface definition package. Case in which the extension is in the same file as
                 main.

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    complex-main
  @Dependencies: aux_test_a18_01.cj aux_test_a18_02.cj


*/

import p1.AuxTestA1801
import p2.AuxTestA1802

extend AuxTestA1801 <: AuxTestA1802 {
    public func foo(): String { "foo" }
}

main() { }
