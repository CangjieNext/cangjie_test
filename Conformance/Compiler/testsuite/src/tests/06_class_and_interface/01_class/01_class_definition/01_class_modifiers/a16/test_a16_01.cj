/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_01_01_a16_01

  @Level:         1

  @Assertion:   6.1.1.1(16) If a subclass of a sealed class is modified by public open, its subclass can be inherited
                outside the package.
  @Description: Checks that public open subclasses of sealed classes can be inherited outside the package.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a16.cj
  @CompileWarning: no
  @Issue: 6084

*/

package not_p

import utils.assert.Assert
import p.*

class C4 <: C1 { }

class C5 <: C2 { }

class C6 <: C3 { }

main() {
    Assert.isTrue(C4() is C1)
    Assert.isTrue(C4() is C)
    Assert.isTrue(C5() is C2)
    Assert.isTrue(C5() is A)
    Assert.isTrue(C6() is C3)
    Assert.isTrue(C6() is G<Unit>)
}
