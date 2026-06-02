/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a24_03

  @Level:         1
  @Assertion:   2.1.1.1(24) When a non-zero floating point literal rounds to 0 or infinity, then compiler will emit an error.
  @Description: Check rounding to zero for Float32
  @Mode:        compileOnly
  @Negative:    no
  @CompileWarning: yes
  @Structure:   single
  @Issue:       6107
*/

main() {
  let f32_less_then_min_not_zero: Float32 = 0.4012984643E-45 //min_not_zero 1.4012984643E-45
  return 0
}