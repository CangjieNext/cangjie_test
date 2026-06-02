/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_02_a09_06

  @Level:         1

  @Assertion:    3.3.2.2(9) Initialization expression e cannot depend with uninitialized global or
                 static variables. The compiler performs a conservative analysis and considers that e
                 may access uninitialized global variables and static variables then reports an error.
                 The detailed analysis depends on the implementation of the compiler and is not
                 specified in the specification.

  @Description:  Checks that gInt1 cannot be initialized with struct static variable, defined later.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

public class C1 {
    public static var sVar: Int32 = 0
}

var gInt1: Int32 = S1.sVar

public struct S1 {
    public static var sVar: Int32 = C1.sVar
}

main() {
}
