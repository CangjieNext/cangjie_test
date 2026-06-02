
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a12_01

  @Level:         1

  @Assertion:   4.18(12) The following are some examples of bitwise left/right shift operators:
                let p: Int8 = -30
                let q = p << 2 // q = -120 
                let r = p >> 2 // r = -8 
                let r = p >> -2 // error let x: UInt8 = 30
                let b = x << 3 // b = 240 
                let b = x >> 1 // b = 15
  @Description: Checks the given example for the invalid case.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    let p: Int8 = -30
    let r = p >> -2 // error
}
