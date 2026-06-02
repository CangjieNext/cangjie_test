/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a01_105

  @Level:         1

  @Assertion: 4(1): An expression can consist of one or more operands, acted on
              by zero or more operators.
  @Description: Checks that expression cannot consist of 2 range expressions.
  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single

*/

var range1 = 0..10
var range2 = 1..14:3

main() { 
    range1 range2
    return
}
