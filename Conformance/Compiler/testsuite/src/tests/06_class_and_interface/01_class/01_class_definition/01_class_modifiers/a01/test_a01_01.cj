/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a01_01

  @Level:         1

  @Assertion: 6.1.1.1(1)
              Access modifier: If no access modifier is used when defining a class, 
              then the class can only be accessed inside the package.

  @Description: Check that classes with no access modifier can be accessed inside their package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: aux_test_a01_01.cj

*/

package a01

import utils.assert.Assert

open class OCSF_Simple {}
open class OCSF_Generic<a, b, c, d> {}

abstract class ACSF_Simple {}
abstract class ACSF_Generic<A> {}

class CSF_Simple {}
class CSF_Generic<Generic> {}

class RCDF_Simple  <: ACDF_Simple {}
class RCDF_Generic <: ACDF_Generic<Int32, Int64, Float32, Float64> {}
class RCSF_Simple  <: ACSF_Simple {}
class RCSF_Generic <: ACSF_Generic<ACDF_Simple> {}

main() {
  var ocdf_simple  = OCDF_Simple()
  var ocdf_generic = OCDF_Generic<Bool, Rune>()
  var rcdf_simple = RCDF_Simple()
  var rcdf_generic = RCDF_Generic()
  var cdf_simple = CDF_Simple()
  var cdf_generic = CDF_Generic<Unit>()

  Assert.isTrue(ocdf_simple is OCDF_Simple)
  Assert.isTrue(ocdf_generic is OCDF_Generic<Bool, Rune>)
  Assert.isTrue(rcdf_simple is ACDF_Simple)
  Assert.isTrue(rcdf_generic is ACDF_Generic<Int32, Int64, Float32, Float64>)
  Assert.isTrue(cdf_simple is CDF_Simple)
  Assert.isTrue(cdf_generic is CDF_Generic<Unit>)

  var ocsf_simple  = OCSF_Simple()
  var ocsf_generic = OCSF_Generic<Int32, Int32, Int32, Int32>()
  var rcsf_simple = RCSF_Simple()
  var rcsf_generic = RCSF_Generic()
  var csf_simple = CSF_Simple()
  var csf_generic = CSF_Generic<Unit>()

  Assert.isTrue(ocsf_simple is OCSF_Simple)
  Assert.isTrue(ocsf_generic is OCSF_Generic<Int32, Int32, Int32, Int32>)
  Assert.isTrue(rcsf_simple is ACSF_Simple)
  Assert.isTrue(rcsf_generic is ACSF_Generic<ACDF_Simple>)
  Assert.isTrue(csf_simple is CSF_Simple)
  Assert.isTrue(csf_generic is CSF_Generic<Unit>)
}
