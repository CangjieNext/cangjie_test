/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_03_a01_02

  @Level:         1

  @Assertion:       5.8.3(1) If a variable is declared with let and may be of type struct (including static types 
                    that are of type struct, or type variants that may be of type struct), then the variable cannot 
                    access functions of that type that are modified with mut. In all other cases, access is allowed. 
                    
  @Description:     Check that struct type immutable variables can't access mut function of that type: struct type.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct myStruct { 
    var myVar = 10 
    public mut func myMutFunc(): Unit { 
        this.myVar -= 1 
    } 
}

main() { 
    let myStructImpl: myStruct = myStruct() 
    myStructImpl.myMutFunc()
} 
