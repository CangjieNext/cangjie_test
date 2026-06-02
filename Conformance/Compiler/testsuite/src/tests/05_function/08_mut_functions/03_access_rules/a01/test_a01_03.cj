/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_03_a01_03

  @Level:         1

  @Assertion:       5.8.3(1) If a variable is declared with let and may be of type struct (including static types 
                    that are of type struct, or type variants that may be of type struct), then the variable cannot 
                    access functions of that type that are modified with mut. In all other cases, access is allowed. 
                    
  @Description:     Check that struct type immutable variables can't access mut function of that type: generic struct 
                    type.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct myGStruct<T> {
    public mut func myMutFunc(a: T): Unit { 
        var myVar: T = a 
    } 
}

main() { 
    let myGStructBool = myGStruct<Bool>()
    myGStructBool.myMutFunc(true)
} 
