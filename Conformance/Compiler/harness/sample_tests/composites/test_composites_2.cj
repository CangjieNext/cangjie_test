/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:test_composites_2

  @Assertion: Check @Module work 

  @Description: Test with multiple files and different packages and different modules
  
  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Module: composites

  @Dependencies:  M1/m1_top.cj composites_aux_1.cj other/other_aux_1.cj

  @Comment: Added resolving recursive dependedncies like in M1/m1_top.cj
*/

package composites

import m1.m1_top

import other.bar


main() {
  foo()
  bar()
  m1_top()
}