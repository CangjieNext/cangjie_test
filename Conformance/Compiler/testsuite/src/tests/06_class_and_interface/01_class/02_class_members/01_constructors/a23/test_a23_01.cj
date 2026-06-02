/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a23_01

  @Level:         1

  @Assertion: 6.1.2.1(23)
              Primary constructor body: If the super class’s constructor is explicit invoked,
              calling to it must be the first expression in the primary constructor body.

  @Description: Check that the primary constructor can call super if it's first in the body

  @Mode: run

  @Negative: no

  @Structure: single

  @CompileWarning: no

  @Comment: Warnings are because of unused functions.
            Primary constructor is allowed to contain a function definition without uses

*/

import utils.assert.Assert

var super_indicator = ""

open class A {
  init() {
    super_indicator += "A"
  }
}

class OnlySuperNoParams <: A {
  OnlySuperNoParams() {
    super()
  }
}

open class B {
  init(a: Int64, b: Int64, c: Int64) {
    super_indicator += "B"
  }
}

class OnlySuperWithParams <: B {
  OnlySuperWithParams() {
    super(1, 2, 3)
  }
}

open class C {
  init() {
    super_indicator += "C"
  }
}

class SuperNoParamsExpr <: C {
  SuperNoParamsExpr() {
    super()
    this.x = 1 + 2
  }

  var x: Int64
}

open class D {
  init(a: Int64, b: Int64, c: Int64) {
    super_indicator += "D"
  }
}

class SuperWithParamsExpr <: D {
  SuperWithParamsExpr() {
    super(1, 2, 3)
    this.x = 1 - 2
  }

  var x: Int64
}

open class E {
  init() {
    super_indicator += "E"
  }
}

class SuperNoParamsVar <: E {
  SuperNoParamsVar() {
    super()
    let z = 1
  }
}

open class F {
  init(a: Int64, b: Int64, c: Int64) {
    super_indicator += "F"
  }
}

class SuperWithParamsVar <: F {
  SuperWithParamsVar() {
    super(1, 2, 3)
    var m = 2
  }
}

open class G {
  init() {
    super_indicator += "G"
  }
}

class SuperNoParamsFunc <: G {
  SuperNoParamsFunc() {
    super()
    func f() {}
  }
}

open class H {
  init(a: Int64, b: Int64, c: Int64) {
    super_indicator += "H"
  }
}

class SuperWithParamsFunc <: H {
  SuperWithParamsFunc() {
    super(1, 2, 3)
    func f() {}
  }
}

open class I {
  init() {
    super_indicator += "I"
  }
}

class SuperNoParamsAll <: I {
  SuperNoParamsAll() {
    super()
    func f() {
      return 1
    }
    var x = f

    this.m = x()
  }

  var m: Int64
}

open class J {
  init(a: Int64, b: Int64, c: Int64) {
    super_indicator += "J"
  }
}

class SuperWithParamsAll <: J {
  SuperWithParamsAll() {
    super(1, 2, 3)
    let s = 12

    func f(x: Int64) {
      return "${x}"
    }

    m = f(s)
  }

  var m: String
}

main() {
  Assert.equals("", super_indicator)

  let case1 = OnlySuperNoParams()
  Assert.equals("A", super_indicator)

  let case2 = OnlySuperWithParams()
  Assert.equals("AB", super_indicator)

  let case3 = SuperNoParamsExpr()
  Assert.equals("ABC", super_indicator)

  let case4 = SuperWithParamsExpr()
  Assert.equals("ABCD", super_indicator)

  let case5 = SuperNoParamsVar()
  Assert.equals("ABCDE", super_indicator)

  let case6 = SuperWithParamsVar()
  Assert.equals("ABCDEF", super_indicator)

  let case7 = SuperNoParamsFunc()
  Assert.equals("ABCDEFG", super_indicator)

  let case8 = SuperWithParamsFunc()
  Assert.equals("ABCDEFGH", super_indicator)

  let case9 = SuperNoParamsAll()
  Assert.equals("ABCDEFGHI", super_indicator)

  let case10 = SuperWithParamsAll()
  Assert.equals("ABCDEFGHIJ", super_indicator)
}