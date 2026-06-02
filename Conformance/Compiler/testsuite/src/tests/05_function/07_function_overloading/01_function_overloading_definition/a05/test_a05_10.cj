/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_07_01_a05_10

  @Level:         1

  @Assertion:       5.7.1(5) It is worth noting that parameter types are not affected by whether they are named 
                    parameters or have default values and when it comes to parameter types, a type and its aliases 
                    are regarded the same (parameter type). 
 
  @Description:     Check that functions definition with the same name and equals by data type  but different by 
                    parameter types sets of parameters will produce an overload conflict: enum member 
                    functions with user defined type based on standard type
                    
  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/
type myType0 = String
type myType1 = Int64

enum myEnum {

    D
    
    func myFunc(a: String, b: myType1): String {""}
    func myFunc(a: myType0, d: Int64): String {""}
}

main() {
}
