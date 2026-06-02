/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_19_a03_01

  @Level:         1

  @Assertion: 4.19(3)
              The syntax of an range expression is defined as:

              rangeExpression
                  : bitwiseDisjunctionExpression ('..=' | '..')
                    bitwiseDisjunctionExpression ( ':'bitwiseDisjunctionExpression)?
                  | bitwiseDisjunctionExpression
                  ;

  @Description: Check range expression syntax positive examples.

  @Mode: compileonly

  @Negative: yes

  @Issue: 0006480

*/

main() {
    // Rule: rangeExpression = bitwiseDisjunctionExpression ('..=' | '..')
    //                         bitwiseDisjunctionExpression ( ':'bitwiseDisjunctionExpression)?
    // Case: rangeExpression = bitwiseDisjunctionExpression '..=' bitwiseDisjunctionExpression
    var r1 = 0..=3
    var r2 = 0 | 0 ..= 3 & 3
    var r3 = 1 ^ 0 ..= 7 & 3

    // Rule: rangeExpression = bitwiseDisjunctionExpression ('..=' | '..')
    //                         bitwiseDisjunctionExpression ( ':'bitwiseDisjunctionExpression)?
    // Case: rangeExpression = bitwiseDisjunctionExpression '..' bitwiseDisjunctionExpression
    var r4 = 0..3
    var r5 = 0 | 0 .. 3 & 3
    var r6 = 1 ^ 0 .. 7 & 3

    // Rule: rangeExpression = bitwiseDisjunctionExpression ('..=' | '..')
    //                         bitwiseDisjunctionExpression ( ':'bitwiseDisjunctionExpression)?
    // Case: rangeExpression = bitwiseDisjunctionExpression '..='
    //                         bitwiseDisjunctionExpression ':' bitwiseDisjunctionExpression
    var r7 = 0..=3:1
    var r8 = 0 | 0 ..= 3 & 3:1 | 1
    var r9 = 1 ^ 0 ..= 7 & 3:1 & 1

    // Rule: rangeExpression = bitwiseDisjunctionExpression ('..=' | '..')
    //                         bitwiseDisjunctionExpression ( ':'bitwiseDisjunctionExpression)?
    // Case: rangeExpression = bitwiseDisjunctionExpression '..'
    //                         bitwiseDisjunctionExpression ':' bitwiseDisjunctionExpression
    var r10 = 0..3:1
    var r11 = 0 | 0 .. 3 & 3:1 | 1
    var r12 = 1 ^ 0 .. 7 & 3:1 & 1
}

