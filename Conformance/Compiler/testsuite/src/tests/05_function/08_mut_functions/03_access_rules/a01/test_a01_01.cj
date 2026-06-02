/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_03_a01_01

  @Level:         1

  @Assertion:       5.8.3(1) If a variable is declared with let and may be of type struct (including static types 
                    that are of type struct, or type variants that may be of type struct), then the variable cannot 
                    access functions of that type that are modified with mut. In all other cases, access is allowed. 
                    
  @Description:     Check that struct type mutable variables can access mut function of that type.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

interface myInterface { 
    mut func myMutFunc(): Unit 
}

struct myStruct0 <: myInterface { 
    var myVar = 10 
    public mut func myMutFunc(): Unit { 
        this.myVar -= 1 
    } 
    public func myFunc(i: Int64): Int64 { 
        myVar + i 
    } 
}

struct myStruct1 { 
    var myVar: Int64 = 10 
    public func myFunc(i: Int64): Int64 { 
        this.myVar + i 
    } 
}

struct myGStruct<T> {
    public mut func myMutFunc(a: T): Unit { 
        var myVar: T = a 
    } 
}

main() { 
    var myStruct0Impl0: myStruct0 = myStruct0() 
    Assert.equals(10, myStruct0Impl0.myVar)
    myStruct0Impl0.myMutFunc()
    Assert.equals(9, myStruct0Impl0.myVar)
    Assert.equals(15, myStruct0Impl0.myFunc(6))

    var myStruct0Impl1: myInterface = myStruct0() 
    myStruct0Impl1.myMutFunc()

    let myStruct1Impl0: myStruct1 = myStruct1() 
    Assert.equals(10, myStruct1Impl0.myVar)
    Assert.equals(18, myStruct1Impl0.myFunc(8))

    var myGStructInt64 = myGStruct<Int64>()
    myGStructInt64.myMutFunc(12)
} 
