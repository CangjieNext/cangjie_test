/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_02_a01_01

  @Level:         1

  @Assertion:       5.8.2(1) struct types must maintain the same mut modifier when implementing functions of the 
                    interface. 

  @Description:     Check that mut modifier must be used when implementing unimplemented mut interface function.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

interface myInterface { 
    mut func f0(): Unit 
    mut func f1(): String 
    mut func f2(): Int64 
    mut func f4(): Bool { true } 
} 

struct myStruct <: myInterface {
    public var myVar: Int64 = 10
    public mut func f0(): Unit {
        myVar -= 1
    }
    public mut func f1(): String {
        "${myVar}"
    }
    public mut func f2(): Int64 {
        myVar
    }
}

main() { 
    var myStructImpl = myStruct()
    Assert.equals(10, myStructImpl.myVar)
    myStructImpl.f0()
    Assert.equals(9, myStructImpl.myVar)
    Assert.equals("9", myStructImpl.f1())
    Assert.equals(9, myStructImpl.f2())
    Assert.equals(true, myStructImpl.f4())
}
