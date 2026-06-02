/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_05_a03_01

  @Level:         1

  @Assertion:    14.2.5(3) The macro invocation must be in the package where the import macro definition is located to
                 ensure that the macro definition is compiled before the macro invocation point. 

  @Description:  Check that macro invocation must be in the package where the import macro definition is located

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

main(): Unit {
    let r = @Outer @Inner(156)
}
