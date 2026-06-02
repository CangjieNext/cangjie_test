/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_04_a08_01

  @Level:         1

  @Assertion:    14.2.4(8) An inner macro can also communicate with an outer macro by sending key/value pairs.
                When the inner macro executes, it calls the library function setItem; later, when the outer macro
                executes, it calls getChildMessages, getting one message (a map of key/value pairs) for each inner 
                macro invocation that sent messages

  @Description:  Check that the setItem & getChildMessages are available

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

  @Issue:        0006253

*/

import aux_macros_01.*

main(): Unit {
    let t = @Outer @Inner(0)
}
