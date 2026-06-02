/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a07_04

  @Level:         1

  @Assertion:    11.2(7) Cangjie’s access control follows the rule that “an entity with a 
                 lower access level cannot be used to define another entity”.

                 An error will be reported at the declaration when the declaration modified
                 by public uses internal types, including: 
                 • The type of parameters and return value of the function declaration modified
                 by public must be external. 
 
  @Description:  Check that an error will be reported when declaration modified by public has
                 internal type parameter. content inside entity

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    single
 
*/

package pkg2

class C1 {

}

public class TestA0704 {
    public func foo(p1: C1) {
        return 0
    }
}

main() {
    return 0
}