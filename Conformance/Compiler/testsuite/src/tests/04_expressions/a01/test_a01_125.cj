/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a01_125

  @Level:         1

  @Assertion: 4(1): An expression can consist of one or more operands, acted on
              by zero or more operators.
  @Description: Checks that expression cannot consist of two pipeline expressions.
  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single

*/

let x: Int64 = 5

main() {
    (x |> { x: Int64 => x + 1 }) (x |> { x: Int64 => x * 128 })

}
