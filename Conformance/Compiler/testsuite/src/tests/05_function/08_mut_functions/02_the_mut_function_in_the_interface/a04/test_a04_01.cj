/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_02_a04_01

  @Level:         1

  @Assertion:       5.8.2(4) Note that when an instance of struct is assigned to an interface type, it is copy 
                    semantics, so the interface’s mut function does not modify the value of the original struct 
                    instance.

  @Description:     Check that when instance of struct is assigned to an interface type, mut function call does 
                    not modify the value of the original struct.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

interface myInterface {
    mut func myFunc(): Unit 
} 

struct myStruct <: myInterface { 
    var flag = true 
    public mut func myFunc(): Unit { 
        flag = !flag 
    } 
}
 
main() { 
    var myStructImpl0 = myStruct() 
    Assert.equals(true, myStructImpl0.flag) 
    myStructImpl0.myFunc()
    Assert.equals(false, myStructImpl0.flag) 
    var myStructImpl1: myInterface  = myStructImpl0 
    myStructImpl1.myFunc() 
    Assert.equals(false, myStructImpl0.flag) 
    return 0 
} 