/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_05_a04_02

  @Level:         1

  @Assertion:    13.1.3.5(4)
                 Structs modified by @C must follow a few
                 restrictions:
                 - it cannot implement or extend interface.

  @Description:  Check if @C struct may extend an interface.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

interface I1 {}

@C
struct ABC {
    var x: Int32
    init() { x = 0 }
}

extend ABC <: I1 {}

main() {
}