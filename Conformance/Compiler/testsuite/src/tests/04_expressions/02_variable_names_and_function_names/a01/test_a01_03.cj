/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_02_a01_03

  @Level:         1

  @Assertion: 4.2(1) The variable name and the function name themselves
              (including variables or functions referred to by package
              names) are also expressions.
  @Description: Checks that function names declared in another file by the
                same package are expressions.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a01.cj  

*/

package a01

main() {
    empty
    with_params
    with_return
    generic<Int32>
    complex<Int32, Int64, String>
 
    return
}
