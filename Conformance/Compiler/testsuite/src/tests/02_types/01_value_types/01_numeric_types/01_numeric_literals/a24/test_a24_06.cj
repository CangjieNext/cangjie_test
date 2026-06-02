/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a24_06

  @Level:         1
  @Assertion:   2.1.1.1(24) When a non-zero floating point literal rounds to 0 or infinity, then compiler will emit an error.
  @Description: Check rounding to infinity for Float64
  @Mode:        compileOnly
  @Negative:    no
  @CompileWarning: yes
  @Structure:   single
  @Issue:       6107
*/

main() {
  let f64_more_then_max_not_inf: Float64 = 2.7976931348623157e308 //max_not_inf 1.7976931348623157e308
  return 0
}