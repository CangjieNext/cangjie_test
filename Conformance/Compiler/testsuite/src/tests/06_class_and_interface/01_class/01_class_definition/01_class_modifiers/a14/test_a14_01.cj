/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_01_01_a14_01

  @Level:         1

  @Assertion:   6.1.1.1(14) –The public modifier is optional when defining a sealed class because the semantics of
                public are already implied by sealed.
  @Description: Checks that sealed classes are visible outside the package they are declared in.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a14.cj
  @CompileWarning: no
  @Issue: 6083, 6084

*/

package not_p

import p.*

main() {
    A.x
    0
}
