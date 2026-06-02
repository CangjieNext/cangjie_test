/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a02_02

  @Level:         1

  @Assertion: 6.1.1.1(2)
              Also, class can be declared with modifier public, then it can be accessed outside the package.

  @Description: Check that classes with modifier public can be accessed from the same package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: aux_test_a02_02.cj

*/

package a02

import utils.assert.Assert

public class PSF_Simple {}
public class PSF_Generic<A> {}

public open class POSF_Simple {}
public open class POSF_Generic<B> {}

public abstract class PASF_Simple {}
public abstract class PASF_Generic<C> {}

open public class OPSF_Simple {}
open public class OPSF_Generic<D> {}

abstract public class APSF_Simple {}
abstract public class APSF_Generic<E> {}

class PRDF_Simple <: PADF_Simple {}
class PRDF_Generic <: PADF_Generic<Float64, Float64, Float64> {}
class RPDF_Simple <: APDF_Simple {}
class RPDF_Generic <: APDF_Generic<Object, Object, Object, Object, Object> {}

class PRSF_Simple <: PASF_Simple {}
class PRSF_Generic <: PASF_Generic<PDF_Simple> {}
class RPSF_Simple <: APSF_Simple {}
class RPSF_Generic <: APSF_Generic<Int32> {}

main() {
  var pdf_simple = PDF_Simple()
  var pdf_generic = PDF_Generic<Bool>()
  var podf_simple = PODF_Simple()
  var podf_generic = PODF_Generic<Int32, Int32>()
  var padf_simple = PRDF_Simple()
  var padf_generic = PRDF_Generic()
  var opdf_simple = OPDF_Simple()
  var opdf_generic = OPDF_Generic<Rune, Rune, Rune, Bool>()
  var apdf_simple = RPDF_Simple()
  var apdf_generic = RPDF_Generic()

  Assert.isTrue(pdf_simple is PDF_Simple)
  Assert.isTrue(pdf_generic is PDF_Generic<Bool>)
  Assert.isTrue(podf_simple is PODF_Simple)
  Assert.isTrue(podf_generic is PODF_Generic<Int32, Int32>)
  Assert.isTrue(padf_simple is PADF_Simple)
  Assert.isTrue(padf_generic is PADF_Generic<Float64, Float64, Float64>)
  Assert.isTrue(opdf_simple is OPDF_Simple)
  Assert.isTrue(opdf_generic is OPDF_Generic<Rune, Rune, Rune, Bool>)
  Assert.isTrue(apdf_simple is APDF_Simple)
  Assert.isTrue(apdf_generic is APDF_Generic<Object, Object, Object, Object, Object>)

  var psf_simple = PSF_Simple()
  var psf_generic = PSF_Generic<Rune>()
  var posf_simple = POSF_Simple()
  var posf_generic = POSF_Generic<Object>()
  var pasf_simple = PRSF_Simple()
  var pasf_generic = PRSF_Generic()
  var opsf_simple = OPSF_Simple()
  var opsf_generic = OPSF_Generic<Float32>()
  var apsf_simple = RPSF_Simple()
  var apsf_generic = RPSF_Generic()

  Assert.isTrue(psf_simple is PSF_Simple)
  Assert.isTrue(psf_generic is PSF_Generic<Rune>)
  Assert.isTrue(posf_simple is POSF_Simple)
  Assert.isTrue(posf_generic is POSF_Generic<Object>)
  Assert.isTrue(pasf_simple is PASF_Simple)
  Assert.isTrue(pasf_generic is PASF_Generic<PDF_Simple>)
  Assert.isTrue(opsf_simple is OPSF_Simple)
  Assert.isTrue(opsf_generic is OPSF_Generic<Float32>)
  Assert.isTrue(apsf_simple is APSF_Simple)
  Assert.isTrue(apsf_generic is APSF_Generic<Int32>)
}
