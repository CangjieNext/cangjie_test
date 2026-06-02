/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a09_01

  @Level:         1

  @Assertion: 6.3.4.1(9)
              redef modifier cannot be used for a static initializer
              because it’s only called implicitly, the compiler reports an error otherwise.

  @Description: Check that a parent class and a child class can have different static initializers
                without the 'redef' keyword usage

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006136, 0006084

*/

import utils.assert.Assert

open class Open {
    static init() {
        open_check = "Open"
    }

    static let open_check: String
}

class C1 <: Open {
    static init() {
        c1_check = "C1"
    }

    static let c1_check: String
}

class C4<T> <: Open {
    static init() {
        c4_check = "C4"
    }

    static let c4_check: String
}

abstract class Abstract {
    static init() {
        abstract_check = "Abstract"
    }

    static let abstract_check: String
}

class C2 <: Abstract {
    static init() {
        c2_check = "C2"
    }

    static let c2_check: String
}

class C5<T> <: Abstract {
    static init() {
        c5_check = "C5"
    }

    static let c5_check: String
}

sealed abstract class Sealed {
    static init() {
        sealed_check = "Sealed"
    }

    static let sealed_check: String
}

class C3 <: Sealed {
    static init() {
        c3_check = "C3"
    }

    static let c3_check: String
}

class C6<T> <: Sealed {
    static init() {
        c6_check = "C6"
    }

    static let c6_check: String
}

main() {
    Assert.equals("Open", Open.open_check)
    Assert.equals("Abstract", Abstract.abstract_check)
    Assert.equals("Sealed", Sealed.sealed_check)

    Assert.equals("C1", C1.c1_check)
    Assert.equals("C2", C2.c2_check)
    Assert.equals("C3", C3.c3_check)

    Assert.equals("C4", C4<Unit>.c4_check)
    Assert.equals("C5", C5<Unit>.c5_check)
    Assert.equals("C6", C6<Unit>.c6_check)
}