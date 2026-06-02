/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a02_01

  @Level:         1

  @Assertion: 6.2.4.1(2)
              When an abstract class implements an interface,
              it is allowed not to implement the functions and properties in the interface.

  @Description: Check that an abstract class does not need to implement all abstract members
                of the superinterface

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124, 0006396

*/

import utils.assert.Assert

interface I {
    func f1(): Unit
    static func f2(): Unit
    static func f3<T>(): Unit

    mut prop p1: Int64
    prop p2: Int64
    static mut prop p3: Int64
    static prop p4: Int64

    operator func ()(): Unit
}

// Do not implement anything
abstract class C <: I {
    public static func f2() {}
    public static func f3<T>() {}
    public static mut prop p3: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public static prop p4: Int64 {
        get() {
            1
        }
    }
}

// Do not implement an instance function
abstract class C1 <: I {
    public static func f2() {}
    public static func f3<T>() {}

    public mut prop p1: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public prop p2: Int64 {
        get() {
            1
        }
    }
    public static mut prop p3: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public static prop p4: Int64 {
        get() {
            1
        }
    }
    public operator func ()() {}
}

// Do not implement a static function
abstract class C2 <: I {
    public func f1() {}
    public static func f2() {}
    public static func f3<T>() {}

    public mut prop p1: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public prop p2: Int64 {
        get() {
            1
        }
    }
    public static mut prop p3: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public static prop p4: Int64 {
        get() {
            1
        }
    }
    public operator func ()() {}
}

// Do not implement a static generic function
abstract class C3 <: I {
    public func f1() {}
    public static func f2() {}
    public static func f3<T>() {}

    public mut prop p1: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public prop p2: Int64 {
        get() {
            1
        }
    }
    public static mut prop p3: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public static prop p4: Int64 {
        get() {
            1
        }
    }
    public operator func ()() {}
}

// Do not implement an instance mutable property
abstract class C4 <: I {
    public func f1() {}
    public static func f2() {}
    public static func f3<T>() {}

    public prop p2: Int64 {
        get() {
            1
        }
    }
    public static mut prop p3: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public static prop p4: Int64 {
        get() {
            1
        }
    }
    public operator func ()() {}
}

// Do not implement an instance immutable property
abstract class C5 <: I {
    public func f1() {}
    public static func f2() {}
    public static func f3<T>() {}

    public mut prop p1: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public static mut prop p3: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public static prop p4: Int64 {
        get() {
            1
        }
    }
    public operator func ()() {}
}

// Do not implement a static mutable property
abstract class C6 <: I {
    public func f1() {}
    public static func f2() {}
    public static func f3<T>() {}

    public mut prop p1: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public prop p2: Int64 {
        get() {
            1
        }
    }
    public static mut prop p3: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public static prop p4: Int64 {
        get() {
            1
        }
    }
    public operator func ()() {}
}

// Do not implement a static immutable property
abstract class C7 <: I {
    public func f1() {}
    public static func f2() {}
    public static func f3<T>() {}

    public mut prop p1: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public prop p2: Int64 {
        get() {
            1
        }
    }
    public static mut prop p3: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public static prop p4: Int64 {
        get() {
            1
        }
    }
    public operator func ()() {}
}

// Do not implement an operator
abstract class C8 <: I {
    public func f1() {}
    public static func f2() {}
    public static func f3<T>() {}

    public mut prop p1: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public prop p2: Int64 {
        get() {
            1
        }
    }
    public static mut prop p3: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    public static prop p4: Int64 {
        get() {
            1
        }
    }
}

class TypeChecker<T> {}

main() {
    let c = TypeChecker<C>()
    Assert.isTrue(c is TypeChecker<C>)

    let c1 = TypeChecker<C1>()
    Assert.isTrue(c1 is TypeChecker<C1>)

    let c2 = TypeChecker<C2>()
    Assert.isTrue(c2 is TypeChecker<C2>)

    let c3 = TypeChecker<C3>()
    Assert.isTrue(c3 is TypeChecker<C3>)

    let c4 = TypeChecker<C4>()
    Assert.isTrue(c4 is TypeChecker<C4>)

    let c5 = TypeChecker<C5>()
    Assert.isTrue(c5 is TypeChecker<C5>)

    let c6 = TypeChecker<C6>()
    Assert.isTrue(c6 is TypeChecker<C6>)

    let c7 = TypeChecker<C7>()
    Assert.isTrue(c7 is TypeChecker<C7>)

    let c8 = TypeChecker<C8>()
    Assert.isTrue(c8 is TypeChecker<C8>)
}