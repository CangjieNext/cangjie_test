/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a01_013

  @Level:         1

  @Assertion: 4(1): An expression can consist of one or more operands, acted on
              by zero or more operators.
  @Description: Checks that an expression cannot consist of two matching 
                expressions.
  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @CompileWarning: Ignore

*/

var i = 0

main() { 
    match (i) { 
        case 0 => 0
        case 10 | 20 | 30 | 40 | 50 => 1
        case 60 => 2
        case 70 | 80 => 3
        case 90 | 100 => 4
        case _ => -1
    } match ((0, 100)) { 
        case (1, 100)   => 100
        case (2, score) => score
        case (_, _) => 0
    }
    
    return
}
