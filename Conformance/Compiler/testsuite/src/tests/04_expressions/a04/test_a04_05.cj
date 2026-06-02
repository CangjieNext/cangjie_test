/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a04_05

  @Level:         1

  @Assertion: 4(4): Expressions can be composed into composite expressions. 
  @Description: Checks that matching expression can be a part of the composite
                expression. Tests constant, wildcard, binding, tupples, type, 
                enum, guard patterns.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: Ignore

*/

import utils.assert.Assert

open class Less {} 
open class More <: Less {}

enum Foo {
    A | B | C
}
var b = B

func getATuple(): (Int64, Int64) {
    (71, 26)
}

var score = 12
var previous = 5
let tuple = getATuple()
let object = Less()
var isScored = true

main() {

    var result: Int64 = match (Assert.getRuntimeZero() + 1) { 
        case 0 => 0
        case 10 | 20 | 30 | 40 | 50 => 1
        case 60 => 2
        case 70 | 80 => 3
        case 90 | 100 => 4
        case _ => -1
    } + match (100) { 
        case 0 => 0
        case 10 | 20 | 30 | 40 | 50 => 1
        case 60 => 2
        case 70 | 80 => 3
        case 90 | 100 => 4
        case _ => -1
    } % (match(score) { 
        case 1 => 2 
        case 2 => 4
        case 3 => 6 
        case 4 => 8
        case 5 => 10
        case other => 
            Assert.equals(score, other)
            previous * 3
    } - match (tuple) { 
        case (1, 100)   => 100
        case (2, score) => score
        case (3, score) => score + 4
        case (_, _) => 0
    }) / (match (object) {
        case _: More => 32
        case _ => 16
    } + match (b) {
        case A => 0 
        case B => 1 
        case C => 2 
    }) << match("any") { 
        case _ => 1 
    } + match { 
        case score < 10 && isScored => 2 
        case score < 35 && isScored => 4
        case score < 90 && isScored => 6 
        case score > 90 && isScored => 8
        case _ => 1
    }

    Assert.isTrue(result is Int64)
    Assert.equals(-32, result)
}
