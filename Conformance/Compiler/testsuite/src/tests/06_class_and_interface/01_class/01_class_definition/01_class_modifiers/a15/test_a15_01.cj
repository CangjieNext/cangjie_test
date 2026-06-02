/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_01_01_a15_01

  @Level:         1

  @Assertion:   6.1.1.1(15) –Subclasses of a sealed class may be modified by open/sealed, or may not use any inherited
                modifiers. 
  @Description: Checks that subclasses of a sealed class can have open/sealed/default package visibility modifiers.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6084

*/

import utils.assert.Assert

sealed abstract class C { }

class C1 <: C { }

open class C2 <: C { }

sealed abstract class C3 <: C { }

sealed abstract class A { }

class C4 <: A { }

open class C5 <: A { }

sealed abstract class C6 <: A { }

sealed abstract class G<T> { }

class C7 <: G<Float16> { }

open class C8 <: G<Float32> { }

sealed abstract class C9 <: G<Float64> { }

main() {
    Assert.isTrue(C1() is C)
    Assert.isTrue(C2() is C)
    Assert.isTrue(C4() is A)
    Assert.isTrue(C5() is A)
    Assert.isTrue(C7() is G<Float16>)
    Assert.isTrue(C8() is G<Float32>)
}
