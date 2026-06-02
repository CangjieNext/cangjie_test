/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_05_a05_02

  @Level:         1

  @Assertion:    13.1.3.5(5)  Structs modified by @C must follow a few
                 restrictions:
                 - it can be used as element type of tuple.

  @Description:  Check using @C struct as a tuple element type (implicit type).

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006218

  @Comment:      

*/

@C
struct ABC {
    var x: Int32
    init() { x = 0 }
}

main() {
    let T1 = (12, ABC())
}
