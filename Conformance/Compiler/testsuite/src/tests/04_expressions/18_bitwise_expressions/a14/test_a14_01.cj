
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a14_01

  @Level:         1

  @Assertion:   4.18(14)
                let x1 : UInt8 = 30 // 0b00011110
                let y1 = x1 >> 11 // compilation error
  @Description: Checks the given example.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    let x1 : UInt8 = 30 // 0b00011110
    let y1 = x1 >> 11 // compilation error
}
