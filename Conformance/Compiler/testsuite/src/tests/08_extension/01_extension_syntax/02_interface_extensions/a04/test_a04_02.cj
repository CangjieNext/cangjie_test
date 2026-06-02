/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a04_02

  @Level:         1

  @Assertion:   8.1.2(4) Using interface extensions for a type to implement interface I is
                equivalent to implementing interface I at type definition time, but the scope
                of use is limited by the extension import and export, see Extension Import
                and Export for details.

  @Description: Checks that scope of use of interface extensions is limited by its import and
                export rules.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   complex-main
  @Dependencies: aux_test_a04_02.cj
  @Issue:       


*/

import p2.*

main() {
    let b = AuxTestA0401()
    b.foo1()
    b.foo2() //error
}
