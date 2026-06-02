/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_a01_01

  @Level:         1

  @Assertion: 6.2.3(1)
              An interface can inherit one or more interfaces

  @Description: Check that an interface can inherit other interfaces

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

interface I1 {}
interface I2<T> {}

interface I3 {
    func f(): Unit
}

interface I4 {
    func g() {}
}

interface I5 {
    mut prop p: Int64
}

interface I6 {
    mut prop q: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

interface I7 {
    func a1(): Unit
    static func a2(): Unit
    prop a3: Int64
    static mut prop a4: Int64
}

interface I8 {
    func m1() {}
    static func m2() {}
    prop m3: Int64 {
        get() {
            1
        }
    }
    static mut prop m4: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

interface I9 {
    func i1(): Unit
    static func i2(): Unit
    prop i3: Int64
    static mut prop i4: Int64

    func i5() {}
    static func i6() {}
    prop i7: Int64 {
        get() {
            1
        }
    }
    static mut prop i8: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

interface J1 <: I1 {}

interface J2 <: I2<Unit> {}

interface J3 <: I3 {}

interface J4 <: I4 {}

interface J5 <: I5 {}

interface J6 <: I6 {}

interface J7 <: I7 {
    static func a2() {}
    static mut prop a4: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

interface J8 <: I8 {}

interface J9 <: I9 {
    static func i2() {}

    static mut prop i4: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

interface J10<T> <: I1 {}

interface J11<T> <: I2<Unit> {}

interface J12<T> <: I3 {}

interface J13<T> <: I4 {}

interface J14<T> <: I5 {}

interface J15<T> <: I6 {}

interface J16<T> <: I7 {
    static func a2() {}
    static mut prop a4: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

interface J17<T> <: I8 {}

interface J18<T> <: I9 {
    static func i2() {}

    static mut prop i4: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

interface J19 <: I1 & I2<Unit> & I3 &I4 & I5 & I6 & I7 & I8 & I9 {
    static func i2() {}
    static func a2() {}

    static mut prop a4: Int64 {
        get() {
            1
        }
        set(v) {}
    }

    static mut prop i4: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

interface J20<T> <: I1 & I2<Unit> & I3 &I4 & I5 & I6 & I7 & I8 & I9 {
    static func a2() {}
    static func i2() {}

    static mut prop a4: Int64 {
        get() {
            1
        }
        set(v) {}
    }

    static mut prop i4: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

class TypeChecker1<T> where T <: I1 {}
class TypeChecker2<T> where T <: I2<Unit> {}
class TypeChecker3<T> where T <: I3 {}
class TypeChecker4<T> where T <: I4 {}
class TypeChecker5<T> where T <: I5 {}
class TypeChecker6<T> where T <: I6 {}
class TypeChecker7<T> where T <: I7 {}
class TypeChecker8<T> where T <: I8 {}
class TypeChecker9<T> where T <: I9 {}

main() {
    let c1 = TypeChecker1<J1>()
    Assert.isTrue(c1 is TypeChecker1<J1>)

    let c2 = TypeChecker2<J2>()
    Assert.isTrue(c2 is TypeChecker2<J2>)

    let c3 = TypeChecker3<J3>()
    Assert.isTrue(c3 is TypeChecker3<J3>)

    let c4 = TypeChecker4<J4>()
    Assert.isTrue(c4 is TypeChecker4<J4>)

    let c5 = TypeChecker5<J5>()
    Assert.isTrue(c5 is TypeChecker5<J5>)

    let c6 = TypeChecker6<J6>()
    Assert.isTrue(c6 is TypeChecker6<J6>)

    let c7 = TypeChecker7<J7>()
    Assert.isTrue(c7 is TypeChecker7<J7>)

    let c8 = TypeChecker8<J8>()
    Assert.isTrue(c8 is TypeChecker8<J8>)

    let c9 = TypeChecker9<J9>()
    Assert.isTrue(c9 is TypeChecker9<J9>)

    let c10 = TypeChecker1<J10<Unit>>()
    Assert.isTrue(c10 is TypeChecker1<J10<Unit>>)

    let c11 = TypeChecker2<J11<Unit>>()
    Assert.isTrue(c11 is TypeChecker2<J11<Unit>>)

    let c12 = TypeChecker3<J12<Unit>>()
    Assert.isTrue(c12 is TypeChecker3<J12<Unit>>)

    let c13 = TypeChecker4<J13<Unit>>()
    Assert.isTrue(c13 is TypeChecker4<J13<Unit>>)

    let c14 = TypeChecker5<J14<Unit>>()
    Assert.isTrue(c14 is TypeChecker5<J14<Unit>>)

    let c15 = TypeChecker6<J15<Unit>>()
    Assert.isTrue(c15 is TypeChecker6<J15<Unit>>)

    let c16 = TypeChecker7<J16<Unit>>()
    Assert.isTrue(c16 is TypeChecker7<J16<Unit>>)

    let c17 = TypeChecker8<J17<Unit>>()
    Assert.isTrue(c17 is TypeChecker8<J17<Unit>>)

    let c18 = TypeChecker9<J18<Unit>>()
    Assert.isTrue(c18 is TypeChecker9<J18<Unit>>)

    let c19 = TypeChecker1<J19>()
    Assert.isTrue(c19 is TypeChecker1<J19>)

    let c20 = TypeChecker2<J19>()
    Assert.isTrue(c20 is TypeChecker2<J19>)

    let c21 = TypeChecker3<J19>()
    Assert.isTrue(c21 is TypeChecker3<J19>)

    let c22 = TypeChecker4<J19>()
    Assert.isTrue(c22 is TypeChecker4<J19>)

    let c23 = TypeChecker5<J19>()
    Assert.isTrue(c23 is TypeChecker5<J19>)

    let c24 = TypeChecker6<J19>()
    Assert.isTrue(c24 is TypeChecker6<J19>)

    let c25 = TypeChecker7<J19>()
    Assert.isTrue(c25 is TypeChecker7<J19>)

    let c26 = TypeChecker8<J19>()
    Assert.isTrue(c26 is TypeChecker8<J19>)

    let c27 = TypeChecker9<J19>()
    Assert.isTrue(c27 is TypeChecker9<J19>)

    let c28 = TypeChecker1<J20<Bool>>()
    Assert.isTrue(c28 is TypeChecker1<J20<Bool>>)

    let c29 = TypeChecker2<J20<Bool>>()
    Assert.isTrue(c29 is TypeChecker2<J20<Bool>>)

    let c30 = TypeChecker3<J20<Bool>>()
    Assert.isTrue(c30 is TypeChecker3<J20<Bool>>)

    let c31 = TypeChecker4<J20<Bool>>()
    Assert.isTrue(c31 is TypeChecker4<J20<Bool>>)

    let c32 = TypeChecker5<J20<Bool>>()
    Assert.isTrue(c32 is TypeChecker5<J20<Bool>>)

    let c33 = TypeChecker6<J20<Bool>>()
    Assert.isTrue(c33 is TypeChecker6<J20<Bool>>)

    let c34 = TypeChecker7<J20<Bool>>()
    Assert.isTrue(c34 is TypeChecker7<J20<Bool>>)

    let c35 = TypeChecker8<J20<Bool>>()
    Assert.isTrue(c35 is TypeChecker8<J20<Bool>>)

    let c36 = TypeChecker9<J20<Bool>>()
    Assert.isTrue(c36 is TypeChecker9<J20<Bool>>)
}