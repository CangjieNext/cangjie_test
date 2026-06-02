/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_07_01_a04_04

  @Level:         1

  @Assertion:       5.7.1(4) • The parameter type must be different and one of the following conditions must be 
                    satisfied: 
                        – The number of function parameters are different. 
                        – The number of functions parameters are the same, but the parameter types at the 
                        corresponding positions are different. 
                        – Must be visible in a scope. 
 
  @Description:     Check that functions in one scope with the same names with the same parameters type in the same 
                    order produce an overload conflict: struct members functions.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct myStruct {
    func myFunc(a: Int64, b: String) { "${a} ${b}" }
    func myFunc(x: Int64, by String) { "${a} ${b}" }
}

main() {
}

