/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_03_a09_01

  @Level:         1

  @Assertion:       5.3.3(9) Both normal function calls and constructor calls can use this syntax, containing this()
                    and super(). 
 
  @Description:     Check that constructors call can use trailing closure syntax.

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @CompileWarning 

*/
import utils.assert.Assert

open class myOClass {
    var z: Int64 = 3
    myOClass(fn: ()->Int64) {
        this.z = fn()
    }
}

class myClass0 {
    var a: Int64 = 3
    init() {
        this(12, {i => i + i})
    }
    init(b: Int64) {
        this(b){i => i + i}
    }
    myClass0(a: Int64, fn: (Int64)->Int64) {
        this.a = fn(a)
    }
}

class myClass1 <: myOClass {
    var a: Int64 = 3
    init() {
        this(12){i => i * 4}
    }
    init(d: Int64) {
        this(d, {i => i - 4})
    }
    myClass1(a: Int64, fn: (Int64)->Int64) {
        super({=> a + 7})
        this.a = fn(a)
    }
}

main() {
    var myClass0Impl0 = myClass0()
    Assert.equals(24, myClass0Impl0.a)
    var myClass0Impl1 = myClass0(4)
    Assert.equals(8, myClass0Impl1.a)

    var myOClassImpl = myOClass(){ => 12 + 4}
    Assert.equals(16, myOClassImpl.z)

    var myClass1Impl0 = myClass1()
    Assert.equals(48, myClass1Impl0.a)
    Assert.equals(19, myClass1Impl0.z)
    var myClass1Impl1 = myClass1(6)
    Assert.equals(2, myClass1Impl1.a)
    Assert.equals(13, myClass1Impl1.z)
}
