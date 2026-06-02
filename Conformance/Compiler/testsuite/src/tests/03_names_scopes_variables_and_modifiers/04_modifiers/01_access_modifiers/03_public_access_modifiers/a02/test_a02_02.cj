/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         03_04_01_03_a02_02

  @Level:         1
  @Assertion:    3.4.1.3(2) Note: public-modified top-level members are also accessible outside the package.

  @Description:  Test various structures without public modifier are inaccessible

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    complex-main
  @Dependencies: aux_test_a02.cj

*/

package pkg2

import pkg1.*

class ImplI1 <: I1 {
    public func f1(): Int32 {
        return 666
    }
}

main() {
}
