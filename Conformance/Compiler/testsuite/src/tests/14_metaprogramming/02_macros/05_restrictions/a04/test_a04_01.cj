/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_05_a04_01

  @Level:         1

  @Assertion:    14.2.5(4) Cyclic dependency import of macros is not supported. 

  @Description:  Check that the macro expression cannot support cyclic dependency

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

*/

import aux_macros_01.*

main(): Unit {
    let r = @Inner(156)
}
