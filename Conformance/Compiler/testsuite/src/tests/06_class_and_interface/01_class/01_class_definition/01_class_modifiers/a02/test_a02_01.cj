/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a02_01

  @Level:         1

  @Assertion: 6.1.1.1(2)
              Also, class can be declared with modifier public, then it can be accessed outside the package.

  @Description: Check that classes with modifier public can be accessed from another package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: aux_test_a02_01.cj

*/

import utils.assert.Assert
import pkg_a02.*

class PR_Simple <: PA_Simple {}
class PR_Generic <: PA_Generic<Float64, Float64, Float64> {}
class RP_Simple <: AP_Simple {}
class RP_Generic <: AP_Generic<Object, Object, Object, Object, Object> {}

main() {
  var p_simple = P_Simple()
  var p_generic = P_Generic<Bool>()
  var po_simple = PO_Simple()
  var po_generic = PO_Generic<Int32, Int32>()
  var pa_simple = PR_Simple()
  var pa_generic = PR_Generic()
  var op_simple = OP_Simple()
  var op_generic = OP_Generic<Rune, Rune, Rune, Bool>()
  var ap_simple = RP_Simple()
  var ap_generic = RP_Generic()

  Assert.isTrue(p_simple is P_Simple)
  Assert.isTrue(p_generic is P_Generic<Bool>)
  Assert.isTrue(po_simple is PO_Simple)
  Assert.isTrue(po_generic is PO_Generic<Int32, Int32>)
  Assert.isTrue(pa_simple is PA_Simple)
  Assert.isTrue(pa_generic is PA_Generic<Float64, Float64, Float64>)
  Assert.isTrue(op_simple is OP_Simple)
  Assert.isTrue(op_generic is OP_Generic<Rune, Rune, Rune, Bool>)
  Assert.isTrue(ap_simple is AP_Simple)
  Assert.isTrue(ap_generic is AP_Generic<Object, Object, Object, Object, Object>)
}
