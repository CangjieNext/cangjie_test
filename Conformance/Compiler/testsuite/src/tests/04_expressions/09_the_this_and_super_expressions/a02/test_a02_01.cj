/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_09_a02_01

  @Level:         1

  @Assertion: 4.9(2)
              this can appear in all instance members and constructors to represent the current instance and super can
              only appear in class type definitions to represent instances of the direct parent class (see Chapter 6
              Classes for details).

  @Description: Check usage of this in instance members and constructors and super in class type definitions.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

open class B {
    func getSeven() {
        return 7
    }
}

class C <: B {
    init() {
        // Usage of 'this' in class constructor.
        this.x = 5
    }

    func getX() {
        // Usage of 'this' in class member function.
        return this.x
    }

    func getSuperSeven() {
        // Usage of 'super' in class member function.
        return super.getSeven()
    }

    var x: Int64
}

struct S {
    S(var x!: Int64) {
        // Usage of 'this' in struct constructor.
        this.x ++
    }

    func getX() {
        // Usage of 'this' in struct member function
        return this.x
    }
}

enum E {
    | Data(Int64)
    | Code(Int64)

    func isCode() {
        // Usage of 'this' in enum member function.
        match (this) {
            case Data(x) => false
            case Code(x) => true
        }
    }
}

main() {
    var c = C()
    var s = S(x: 8)
    var e = E.Code(3)

    Assert.equals(5, c.getX())
    Assert.equals(7, c.getSuperSeven())
    Assert.equals(9, s.getX())
    Assert.isTrue(e.isCode())
}

