/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a25_01

  @Level:         1

  @Assertion: 6.1.2.1(25)
              After calling super, expressions, local variable declarations and
              local function definitions are allowed in the primary constructor body. 

  @Description: Check that the listed elements are allowed in the primary constructor body

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

// Functions
class A {
  A(x: Int64, y: Bool) {
    func f() {
      return x + 1
    }

    func g(a: Float64,b: Float64) {
      return a / b
    }

    func foo() {
      if (y) {
        return 5
      } else {
        return 6
      }
    }

    func bar() {
      return ""
    }

    func foobar() {}

    Assert.equals(2, f())
    Assert.approxEquals(0.5, g(1.0, 2.0))
    Assert.equals(5, foo())
    Assert.equals("", bar())
    Assert.isTrue(foobar() is Unit)
  }
}

// Functions after super
open class BP {}
class B <: BP  {
  B(x: Int64, y: Bool) {
    super()
    func f<T>() {
      return x + 1
    }

    func g<T>(a: Float64,b: Float64) {
      return a / b
    }

    func foo<T>() {
      if (y) {
        return 5
      } else {
        return 6
      }
    }

    func bar<T>() {
      return ""
    }

    func foobar<T>() {}

    Assert.equals(10, f<Bool>())
    Assert.approxEquals(0.5, g<String>(1.0, 2.0))
    Assert.equals(6, foo<Rune>())
    Assert.equals("", bar<Int64>())
    Assert.isTrue(foobar<Unit>() is Unit)
  }
}

// Variable declarations
class C {
  C() {
    var _int8 = 1i8
    let _int16 = 2i16
    var _int32 = 3i32
    let _int64 = 4
    var _uint8 = 5u8
    let _uint16 = 6u16
    var _uint32 = 7u32
    let _uint64 = 8u64
    var _float16 = 0.5f16
    let _float32 = 0.01f32
    let _float64 = 100.1e100

    Assert.equals(1i8, _int8)
    Assert.equals(2i16, _int16)
    Assert.equals(3i32, _int32)
    Assert.equals(4, _int64)
    Assert.equals(5u8, _uint8)
    Assert.equals(6u16, _uint16)
    Assert.equals(7u32, _uint32)
    Assert.equals(8u64, _uint64)
    Assert.approxEquals(0.5f16, _float16)
    Assert.approxEquals(0.01f32, _float32)
    Assert.approxEquals(100.1e100, _float64)
  }
}

open class DP {
  init(x: Int64) {}
}

// Variable declarations after super
class D <: DP {
  D() {
    super(10)
    var _string = "123"
    let _bool = false
    var _char = 'a'
    let _func = { => 10}
    var _tuple = (1, 1)
    let _array = [1, 2]
    var _unit = ()
    let _range = 1..10:1

    Assert.equals("123", _string)
    Assert.equals(false, _bool)
    Assert.equals('a', _char)
    Assert.equals(10, _func())
    Assert.equals(1, _tuple[0])
    Assert.equals(1, _tuple[1])
    Assert.equals([1, 2], _array)
    Assert.isTrue(_unit is Unit)
    Assert.equals(1..10:1, _range)
  }
}

// Expressions
class E {
  var a = 1
  var b = 2
  var c = 3
  var d = {x: Int64 => x * 2 }
  var e = {x: Int64 => x + 1}
  var f: (Int64) -> Int64
  
  E() {
    a = b + c
    Assert.equals(5, a)

    f = d ~> e
    Assert.equals(3, f(1))

    a = match(c) {
      case 1 => 1
      case _ => 100
    }

    Assert.equals(100, a)
  }
}

// Expressions after super
open class FP {}

class F <: FP {
  var a = 1
  var b = 2
  var c = 3
  var d = {x: Int64 => x * 2 }
  var e = {x: Int64 => x + 1}
  
  F() {
    super()
    a = b |> d
    Assert.equals(4, a)

    for (i in 0..10:1) {
      c++
    }
    Assert.equals(13, c)

    a = e(b)
    Assert.equals(3, a)
  }
}

// Everything
class G {
  G(x: Int64) {
    func f() {
      return x + 5
    }

    var z = x + 1
    var y = x

    let r = y * z / f()
    Assert.equals(7, r)
  }
}

// Everything after super
open class HP {
  init(x: Int64) {}
}

class H <: HP {
  H(x: Int64) {
    super(x + 5)

    func f() {
      return x << 1
    }

    var z = x + 1
    var y = x

    let r = (y | z) & f()
    Assert.equals(0, r)
  }
}


main() {
  let case1 = A(1, true)

  let case2 = B(9, false)

  let case3 = C()

  let case4 = D()

  let case5 = E()

  let case6 = F()

  let case7 = G(10)

  let case8 = H(10)
}