/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_04_a05_03

  @Level:         1

  @Assertion: 4.4.1.4(5) Moreover, if the pattern in the tuple pattern is a constant pattern or an enum pattern, it
              needs to has the same type as the corresponding element of the selector.

  @Description: Checks that mismatching types of the constant pattern in the tuple pattern and in the selector
                causes a compilation error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    match ((10i8, 10i16)) {
        case (10u8, 10i16) => true
        case _ => false
    }
    return
}
