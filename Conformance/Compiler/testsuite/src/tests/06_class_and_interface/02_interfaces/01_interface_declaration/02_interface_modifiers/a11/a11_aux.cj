/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: // in package A
              package A
              public sealed interface I1 {} // OK
              sealed interface I2 {} // OK, 'public' is optional when 'sealed' is used
              open interface I3 {} // OK
              interface I4 {} // OK, 'open' is optional
              class C1 <: I1 {} // OK
              public open class C2 <: I1 {} // OK
              public sealed class C3 <: I1 {} // OK
              extend Int64 <: I1 {} // OK
              // in package B
              package B
              import A.*
              class S1 <: C2 {} // OK
              class S2 <: C3 {} // Error, C3 is sealed class, cannot be inherited here.

  @Description: The example

  @Structure: complex-aux
*/

package a
sealed interface I1 {} // OK
sealed interface I2 {} // OK, 'public' is optional when 'sealed' is used
open interface I3 {} // OK
interface I4 {} // OK, 'open' is optional
class C1 <: I1 {} // OK
public open class A11Aux <: I1 {} // OK
sealed abstract class C3 <: I1 {} // OK
extend Int64 <: I1 {} // OK
