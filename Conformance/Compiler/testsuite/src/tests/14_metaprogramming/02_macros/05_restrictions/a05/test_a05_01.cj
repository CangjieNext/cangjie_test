/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_05_a05_01

  @Level:         1

  @Assertion:    14.2.5(5) For example, the following usage is invalid: pkgA imports pkgB, pkgB imports pkgA, and
                 cyclic dependency exists.

                    // ======= file A.cj
                    macro package pkgA
                    import pkgB.*
                    public macro A(..) {
                        @B(..)  // error
                    }

                    // ======= file B.cj
                    macro package pkgB
                    import pkgA.*
                    public macro B(..) {
                        @A(..)  // error
                    }


  @Description:  Check example

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main
*/

import pkgA.*
import pkgB.*

main(): Unit {
    let r = @A(0)
}
