/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_03_a10_01

  @Level:         1

  @Assertion:       5.3.3(10)
                    this(1, { i => i * i } ) 
                    this(1) { i => i * i } 
                    super(1, { i => i * i } ) 
                    super(1) { i => i * i } 
  
  @Description:     Positive examples from spec

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @CompileWarning 

*/
import utils.assert.Assert

open class myOClass {
    var z: Int64 = 3
    myOClass(a: Int64, fn: (Int64)->Int64) {
        this.z = fn(a)
    }
}

class myClass0 <: myOClass {
    var a: Int64 = 3
    init() {
        this(1, { i => i * i } )
    }
    myClass0(a: Int64, fn: (Int64)->Int64) {
        super(1, { i => i * i } ) 
        this.a = fn(a)
    }
}
class myClass1 <: myOClass {
    var a: Int64 = 3
    init() {
        this(1) { i => i * i }
    }
    myClass1(a: Int64, fn: (Int64)->Int64) {
        super(1) { i => i * i } 
        this.a = fn(a)
    }
}

main() {
    var myClass0Impl = myClass0()
    Assert.equals(1, myClass0Impl.a)
    Assert.equals(1, myClass0Impl.z)

    var myClass1Impl = myClass1()
    Assert.equals(1, myClass1Impl.a)
    Assert.equals(1, myClass1Impl.z)
}
