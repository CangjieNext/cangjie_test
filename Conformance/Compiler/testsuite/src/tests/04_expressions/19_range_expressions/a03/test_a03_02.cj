/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_19_a03_02

  @Level:         1

  @Assertion: 4.19(3)
              The syntax of an range expression is defined as:

              rangeExpression
                  : bitwiseDisjunctionExpression ('..=' | '..')
                    bitwiseDisjunctionExpression ( ':'bitwiseDisjunctionExpression)?
                  | bitwiseDisjunctionExpression
                  ;

  @Description: Check range expression without required '..=' or '..' causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    var range = 0 3
    return
}
