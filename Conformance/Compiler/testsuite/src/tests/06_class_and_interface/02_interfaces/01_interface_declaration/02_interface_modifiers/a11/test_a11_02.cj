/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_02_a11_02

  @Level:         1

  @Assertion: 6.2.1.2(11)
              // in package A
              package A
              public sealed interface I1 {} // OK
              sealed interface I2 {} // OK, 'public' is optional when 'sealed' is used
              interface I3 {} // OK
              interface I4 {} // OK, 'open' is optional
              class C1 <: I1 {} // OK
              public class C2 <: I1 {} // OK
              public sealed class C3 <: I1 {} // OK
              extend Int64 <: I1 {} // OK
              // in package B
              package B
              import A.*
              class S1 <: C2 {} // OK
              class S2 <: C3 {} // Error, C3 is sealed class, cannot be inherited here.

  @Description: Check the correctness of the package A

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a11_aux.cj

  @Issue: 0006084
*/

import utils.assert.Assert

sealed interface I1 {} // OK
sealed interface I2 {} // OK, 'public' is optional when 'sealed' is used
interface I3 {} // OK
interface I4 {} // OK, 'open' is optional
class C1 <: I1 {} // OK
public class TestA1102 <: I1 {} // OK
sealed abstract class C3 <: I1 {} // OK
extend Int64 <: I1 {} // OK

class Check<T> {}

main() {
    let tst1 = C1()
    Assert.isTrue(tst1 is I1)

    let tst2 = TestA1102()
    Assert.isTrue(tst2 is I1)

    Assert.isTrue(1i64 is I1)

    let tst4 = Check<I2>()
    Assert.isTrue(tst4 is Check<I2>)

    let tst5 = Check<I3>()
    Assert.isTrue(tst5 is Check<I3>)

    let tst6 = Check<I4>()
    Assert.isTrue(tst6 is Check<I4>)
}
