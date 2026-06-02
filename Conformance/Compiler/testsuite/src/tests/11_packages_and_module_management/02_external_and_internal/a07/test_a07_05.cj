/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a07_05

  @Level:         1

  @Assertion:    11.2(7) Cangjie’s access control follows the rule that “an entity with a 
                 lower access level cannot be used to define another entity”.

                 An error will be reported at the declaration when the declaration modified
                 by public uses internal types, including: 
                 • The type of parameters and return value of the function declaration modified
                 by public must be external. 
 
  @Description:  Check that the type of parameters and return value of the function declaration modified
                 by public must be external.

  @Mode:         compileonly 

  @Negative:     no  

  @Structure:    single
 
*/

package pkg2

public class C1 {

}

public func foo1() {
    return C1()
}

public func foo2(p1: C1) {
  return 0
}

public class C2 {
    public func foo3() {
        return C1()
    }
}

public class C3 {
    public func foo4(p1: C1) {
        return 0
    }
}

main() {
    return 0
}