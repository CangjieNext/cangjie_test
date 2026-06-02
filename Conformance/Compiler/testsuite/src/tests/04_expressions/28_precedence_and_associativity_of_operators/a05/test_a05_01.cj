/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a05_01

  @Level:         1

  @Assertion: 4.28(5) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description    Usage          Expression type

              .         Left associative   Member access  Name.name      The type of name

  @Description: Check that '.' is left-associative.

  @Mode: run

  @Negative: no

*/

// NOTE: Since member access has no side-effects, the only way to test its associativity is to check that it...
//       works as expected.

import utils.assert.Assert

var global = 1

class A {
    var x: Int64 = 5

    func bar() {
        global *= 2
    }
}

class B {
    var a: A = A()

    func foo() {
        global += 5
        return a
    }
}

main() {
    let b = B()

    // First, 'a' is accessed, second, 'x' is accessed.
    // There is no way to access them in another order.
    let x = b.a.x
    Assert.equals(5, x)

    // Emulate side-effects using instance member function call.
    b.foo().bar()
    Assert.equals(12, global)
}

