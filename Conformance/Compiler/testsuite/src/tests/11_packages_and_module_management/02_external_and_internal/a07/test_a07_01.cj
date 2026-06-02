/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a07_01

  @Level:         1

  @Assertion:    11.2(7) Cangjie’s access control follows the rule that “an entity with a 
                 lower access level cannot be used to define another entity”.

                 An error will be reported at the declaration when the declaration modified
                 by public uses internal types, including: 
                 • The type of parameters and return value of the function declaration modified
                 by public must be external. 
 
  @Description:  Check that an error will be reported when return value of the function declaration
                 modified by public is internal. top-level

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    single
 
*/

package pkg1

class C1 {

}

public func foo() {
    return C1()
}

main() {
    return 0
}