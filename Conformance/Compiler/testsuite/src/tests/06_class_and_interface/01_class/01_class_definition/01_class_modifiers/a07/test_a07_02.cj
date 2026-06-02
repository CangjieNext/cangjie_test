/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a07_02

  @Level:         1

  @Assertion: 6.1.1.1(7)
              abstract: This class is an abstract class.
              Unlike a common class, an abstract class can define common functions and declare abstract functions.
              Only the class modified by this modifier is an abstract class.
              If a function has no body, we call it an abstract function

  @Description: Check that abstract classes can contain no functions

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

abstract class AS {}

abstract class AG<T> {}

public abstract class PAS {}

public abstract class PAG<U, V> {}

abstract public class APS {}

abstract public class APG<T> {}

// Non-abstract classes for runtime checks
class RS <: AS {}

class RG <: AG<Object> {}

class PRS <: PAS {}

public class PRG <: PAG<Int32, Float32> {}

public class RPS <: APS {}

class RPG <: APG<Bool> {}


main() {
  let as_ = RS()
  let ag  = RG()
  let pas = PRS()
  let pag = PRG()
  let aps = RPS()
  let apg = RPG()

  Assert.isTrue(as_ is AS)
  Assert.isTrue(ag  is AG<Object>)
  Assert.isTrue(pas is PAS)
  Assert.isTrue(pag is PAG<Int32, Float32>)
  Assert.isTrue(aps is APS)
  Assert.isTrue(apg is APG<Bool>)
}
