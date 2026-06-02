/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a02_01

  @Level:         1

  @Assertion: 6.1.1.3(2)
              The interfaces implemented by the class are declared by 
              <: I1 & I2 & ... & Ik after the class name or the superclass name if there is one.

  @Description: Check that the construction works correctly

  @Mode: run

  @Negative: no

  @Structure: single
  
  @Issue: 0006128

*/

import utils.assert.Assert

interface _fajkf {}
interface jfkanu {}
interface nairqo {}
interface nffeof {}

class HFljl <: _fajkf & jfkanu & nairqo & nffeof {}

open class FNUiqw {}
class NFHBO <: FNUiqw & _fajkf & nffeof & nairqo & jfkanu {}

interface NFKA<oqq, qej> {}
interface FB28a<fafa, oew3> {}
interface NAkdhq_<fwef> {}

class NFIE <: NFKA<Rune, Rune> & FB28a<Bool, Bool> & NAkdhq_<String> {}

open class Nf2r {}
class FJ4214_ <: Nf2r & NFKA<Int32, Int32> & NAkdhq_<Unit> & FB28a<Bool, Rune> {}

interface fn8239<fhq> {}
interface f3oir2<ffw_f3> {}

class Nflks3<RYhk> <: fn8239<Rune> & f3oir2<RYhk> {}

open class QAX {}
class WQI<fjsl, nfiw> <: QAX & fn8239<fjsl> & f3oir2<nfiw> {}

main() {
  var c1 = HFljl()
  Assert.isTrue(c1 is HFljl)
  Assert.isTrue(c1 is _fajkf)
  Assert.isTrue(c1 is jfkanu)
  Assert.isTrue(c1 is nairqo)
  Assert.isTrue(c1 is nffeof)

  var c2 = NFHBO()
  Assert.isTrue(c2 is NFHBO)
  Assert.isTrue(c2 is _fajkf)
  Assert.isTrue(c2 is jfkanu)
  Assert.isTrue(c2 is nairqo)
  Assert.isTrue(c2 is nffeof)

  var c3 = NFIE()
  Assert.isTrue(c3 is NFIE)
  Assert.isTrue(c3 is NFKA<Rune, Rune>)
  Assert.isTrue(c3 is FB28a<Bool, Bool>)
  Assert.isTrue(c3 is NAkdhq_<String>)

  var c4 = FJ4214_()
  Assert.isTrue(c4 is FJ4214_)
  Assert.isTrue(c4 is NFKA<Int32, Int32>)
  Assert.isTrue(c4 is FB28a<Bool, Rune>)
  Assert.isTrue(c4 is NAkdhq_<Unit>)

  var c5 = Nflks3<String>()
  Assert.isTrue(c5 is Nflks3<String>)
  Assert.isTrue(c5 is fn8239<Rune>)
  Assert.isTrue(c5 is f3oir2<String>)

  var c6 = WQI<Int16, Int8>()
  Assert.isTrue(c6 is WQI<Int16, Int8>)
  Assert.isTrue(c6 is fn8239<Int16>)
  Assert.isTrue(c6 is f3oir2<Int8>)
}
