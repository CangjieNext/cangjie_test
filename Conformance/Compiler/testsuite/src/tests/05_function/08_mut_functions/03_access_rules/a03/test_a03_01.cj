/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_03_a03_01

  @Level:         1

  @Assertion:       5.8.3(3) If a variable may be of type struct (including static types that are of type struct, or 
                    type variants that may be of type struct), then the variable cannot use functions of that type 
                    modified with mut as higher-order functions, and only these mut functions can be called. 

  @Description:     Check that when struct is implementing interface with mut functions only struct member functions 
                    can be called.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

var myTopLevelVar = 0

interface myInterface { 
    mut func myFunc(): Unit {
        myTopLevelVar += 1
    }
}

struct myStruct <: myInterface { 
    var flag: Bool = true 
    public mut func myFunc(): Unit { 
        flag = !flag 
    }
}

main() { 
    var myStructVar0: myInterface = myStruct() 
    Assert.equals(0, myTopLevelVar)
    var mySVar0 = myStructVar0.myFunc
    mySVar0()
    Assert.equals(0, myTopLevelVar)

    var myStructVar1 = myStruct() 
    Assert.equals(0, myTopLevelVar)
    Assert.equals(true, myStructVar1.flag)
    myStructVar1.myFunc()
    Assert.equals(0, myTopLevelVar)
    Assert.equals(false, myStructVar1.flag)

    return 0 
} 
