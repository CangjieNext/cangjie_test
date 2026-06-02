/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a02_01

  @Level:         1

  @Assertion: 6.1.1.2(2)
              The superclass is declared by <: superClass after the class name.

  @Description: Check that '<: superClass' constructions work correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

open class _ofhk {}
class Urqfjqwlk <: _ofhk {}

abstract class _ieqjk {}
class nebqo <: _ieqjk {}

open class uieqh<T> {}
class e1oyr1 <: uieqh<Bool> {}

abstract class peqcma<U, E> {}
class rj418o <: peqcma<Int64, Int64> {}

abstract class Ufha {}
class hjrbhj <: Ufha {}

abstract class _dfjwlh<T> {}
class rhkjfh291h <: _dfjwlh<Bool> {}

public abstract class ruqpPFjl {}
class _fqf_fjkl <: ruqpPFjl {}

public abstract class peqnkmffhw<T> {}
class bbfhj <: peqnkmffhw<String> {}

main() {
  var case1 = Urqfjqwlk()
  Assert.isTrue(case1 is _ofhk)
  Assert.isTrue(case1 is Urqfjqwlk)

  var case2 = nebqo()
  Assert.isTrue(case2 is _ieqjk)
  Assert.isTrue(case2 is nebqo)

  var case3 = e1oyr1()
  Assert.isTrue(case3 is uieqh<Bool>)
  Assert.isTrue(case3 is e1oyr1)

  var case4 = rj418o()
  Assert.isTrue(case4 is peqcma<Int64, Int64>)
  Assert.isTrue(case4 is rj418o)

  var case5 = hjrbhj()
  Assert.isTrue(case5 is Ufha)
  Assert.isTrue(case5 is hjrbhj)

  var case6 = rhkjfh291h()
  Assert.isTrue(case6 is _dfjwlh<Bool>)
  Assert.isTrue(case6 is rhkjfh291h)

  var case7 = _fqf_fjkl()
  Assert.isTrue(case7 is ruqpPFjl)
  Assert.isTrue(case7 is _fqf_fjkl)

  var case8 = bbfhj()
  Assert.isTrue(case8 is peqnkmffhw<String>)
  Assert.isTrue(case8 is bbfhj)
  
}
