/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a01_018

  @Level:         1

  @Assertion: 4(1): An expression can consist of one or more operands, acted on
              by zero or more operators.
  @Description: Checks that an expression cannot consist of two break expressions.
  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single

*/

var cnt = 0

main() { 
    for (i in 0..5) {
        break break
    }
}
