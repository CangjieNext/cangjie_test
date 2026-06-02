/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_01_01_a13_01

  @Level:         1

  @Assertion:   6.1.1.1(13) –sealed: You can use the sealed modifier to indicate that the class can be inherited only
                in the package which the class is defined.
  @Description: Checks that sealed classes can be inherited in the same package.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a13.cj
  @CompileWarning: no
  @Issue: 6084

*/

package p

import utils.assert.Assert

sealed abstract class C0 { }

class C1 <: C { }

class C2 <: C0 { }

sealed abstract class A0 { }

class A1 <: A { }

class A2 <: A0 { }

sealed abstract class G0<T> { }

class G1<T> <: G<T> { }

class G2<T> <: G0<T> { }

main() {
    Assert.isTrue(C1() is C)
    Assert.isTrue(C2() is C0)
    Assert.isTrue(A1() is A)
    Assert.isTrue(A2() is A0)
    Assert.isTrue(G1<Bool>() is G<Bool>)
    Assert.isTrue(G2<Rune>() is G0<Rune>)
}
