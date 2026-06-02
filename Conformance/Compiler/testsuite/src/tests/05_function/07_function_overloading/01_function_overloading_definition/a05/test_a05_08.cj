/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_07_01_a05_08

  @Level:         1

  @Assertion:       5.7.1(5) It is worth noting that parameter types are not affected by whether they are named 
                    parameters or have default values and when it comes to parameter types, a type and its aliases 
                    are regarded the same (parameter type). 
 
  @Description:     Check that functions definition with the same name and equals by data type but different by 
                    parameter types sets of parameters will produce an overload conflict: class member 
                    functions with named parameters with default values
                    
  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct myStruct {
    func myFunc(a: String, b!: Int64 = 8): String {""}
    func myFunc(a: String, d!: Int64 = -4): String {"OOO"}
}

main() {
}
