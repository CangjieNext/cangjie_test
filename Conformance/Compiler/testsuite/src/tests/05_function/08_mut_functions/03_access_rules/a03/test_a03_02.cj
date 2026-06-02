/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_03_a03_02

  @Level:         1

  @Assertion:       5.8.3(3) If a variable may be of type struct (including static types that are of type struct, or 
                    type variants that may be of type struct), then the variable cannot use functions of that type 
                    modified with mut as higher-order functions, and only these mut functions can be called. 

  @Description:     Check that mutable function cannot be used alone as reference in method main.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

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
    var myStructVar = myStruct() 
    var mySFVar = myStructVar.myFunc

    return 0 
} 
