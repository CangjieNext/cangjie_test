/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_07_01_a01_04

  @Level:         1

  @Assertion:       5.7.1(1) In the Cangjie programming language, overloading occurs when function definitions 
                    corresponding to the same function name in a scope do not constitute function redefinition. 
                    When an overload exists, it is necessary to identify which function definition is used when 
                    making a function call based on the contextual information and the argument types of the 
                    function call. 

  @Description:     Check that struct member functions definitions with the same name and the same parameters 
                    set in one scope produce an overload conflicts.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct myStruct {
    func myFunc(a: Int32) { a - 1 }
    func myFunc(a: Int32) { a - 1 }
}

main() {
}
