/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a26_01

  @Level:         1

  @Assertion: 6.1.2.1(26)
              The declarations, definitions and expressions must comply with the rules
              for using this and super in the init constructors.

  @Description: Check the allowed uses of this and super

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006194, 0006124

  @Comment: The behaviour of properties is not well described.
            From some of the statements it seems that properties behave like functions.
            But since there's no clear explanation, the issue 6194 is filed.

*/

import utils.assert.Assert

var place_to_escape: () -> Int64 = { => 1}
var escape_for_only_this = { => Object() }

open class S {
  var super_x = 1
  let super_y = 2

  func super_f() {
    return 5
  }

  mut prop super_mut_prop: Int64 {
    get() {
      -1
    }
    set(v) {}
  }

  prop super_immut_prop: Int64 {
    get() {
      -2
    }
  }
}

class A <: S {
  A() {
    // It's allowed to access initialized 'super' and 'this' instance member variables
    let a = super.super_x
    Assert.equals(1, a)
    let b = super.super_y
    Assert.equals(2, b)
    let c = this.init_x
    Assert.equals(10, c)
    let d = this.init_y
    Assert.equals(20, d)

    // Initialize uninitialized instance member variables
    this.uninit_x = 30
    this.uninit_y = 40

    // After initializing all instance variables it's allowed to access them by 'this'
    let e = this.uninit_x
    Assert.equals(30, e)
    let f = this.uninit_y
    Assert.equals(40, f)

    // After all instance variables are initialized it's allowed
    // to call 'this' and 'super' instance functions
    let g = super.super_f()
    Assert.equals(5, g)
    let h = this.this_f()
    Assert.equals(1, h)

    // After all instance variables are initialized it's allowed
    // to use 'this' as a separate expression
    let i = this
    Assert.isTrue(i is A)

    // After all instance variables are initialized it's allowed
    // to capture 'this' with a lambda and let it escape the constructor
    place_to_escape = { => this.init_x }
    escape_for_only_this = { => this }

    // The rules for properties are likely the same as the rules for functions,
    // i.e. they can be accessed after every instance variable is initialized
    let j = super.super_mut_prop
    Assert.equals(-1, j)
    let k = super.super_immut_prop
    Assert.equals(-2, k)
    let l = this.this_mut_prop
    Assert.equals(-3, l)
    let m = this.this_immut_prop
    Assert.equals(-4, m)
  }

  var init_x = 10
  let init_y = 20

  var uninit_x: Int64
  let uninit_y: Int64

  func this_f() {
    return 1
  }

  mut prop this_mut_prop: Int64 {
    get() {
      -3
    }
    set(v) {}
  }

  prop this_immut_prop: Int64 {
    get() {
      -4
    }
  }
}

main() {
  let tst = A()
  Assert.equals(10, place_to_escape())
  Assert.isTrue(escape_for_only_this() is A)
}