/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a11_15

  @Level:         1

  @Assertion:    11.2(11)
                 The type referenced in the declaration modified by public must be external, specifically: 
    • The type of the inherited class or the implemented interface in the class declaration interface
    declaration enum declaration or struct declaration modified by public must be external and the type of
    members including function variable declaration property modified by public or protected must be external. 
 
  @Description:  Check that compiler throws an error when external type class contains protected func with 
                 internal return type. 

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    single
 
*/

class C1 {}

public class TestA1115 {
    protected func foo() {
        C1()
    }
}

main() {
    return 0
}