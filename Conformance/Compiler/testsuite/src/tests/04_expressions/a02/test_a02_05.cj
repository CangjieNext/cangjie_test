/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_05

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that matching expression has type and value.
                Tests constant, wildcard, Binding, Tupple, Type, Enum, Guard patterns.
  @Mode: run
  @Negative: no
  @Structure: single

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

func getInt() {
    1
}

func checkConstantPattern() {
    var result: Int64 = match (getInt()) { 
        case 0 => 0
        case 10 | 20 | 30 | 40 | 50 => 1
        case 60 => 2
        case 70 | 80 => 3
        case 90 | 100 => 4
        case _ => -1
  }
  Assert.equals(-1, result)
}

func checkWildcardPattern() {
    var result = match (getInt()) { 
        case 0 => 0
        case 10 | 20 | 30 | 40 | 50 => 1
        case 60 => 2
        case 70 | 80 => 3
        case 90 | 100 => 4
        case _ => -1
    }
    Assert.isTrue(result is Int64)
    Assert.equals(-1, result)

    Assert.isTrue(
        match("any") { 
            case _ => "Any String" 
        } is String)

    Assert.equals(
        "a string", 
        match("any") { 
            case _ => "a string" 
        })
}

func checkBindingPattern() {
    var score = 12
    var previous = 5
    var result = match(score) { 
        case 1 => 2 
        case 2 => 4
        case 3 => 6 
        case 4 => 8
        case 5 => 10
        case other => 
            Assert.equals(score, other)
            previous * 3
    }  
    Assert.isTrue(result is Int64)
    Assert.equals(15, result)
}

func checkTupplePattern() {
    let tuple = getATuple()
    var result = match (tuple) { 
        case (1, 100)   => 100
        case (2, score) => score
        case (3, score) => score + 4
        case (_, _) => 0
    }
    Assert.isTrue(result is Int64)
    Assert.equals(0, result)
}

func checkTypePattern() {
    let object = Less()
    var bitness: Int32 = match (object) {
        case _: More => 32
        case _ => 16
    }
    Assert.equals(16, bitness)
 }
  

func checkEnumPattern() {
    let result = match (b) {
        case A => 0 
        case B => 1 
        case C => 2 
    }
    Assert.isTrue(result is Int64)
    Assert.equals(1, result)
}
  
func checkPatternGuard() {
    let score = 150
    var isScored = true
    var result = match { 
        case score < 10 && isScored => "fail" 
        case score < 35 && isScored => "pass"
        case score < 90 && isScored => "good" 
        case score > 90 && isScored => "excellent"
        case _ => "finish"
    }
    Assert.isTrue(result is String)
    Assert.equals("excellent", result)
}

main() {
    checkConstantPattern()
    checkWildcardPattern()
    checkBindingPattern()
    checkTupplePattern()
    checkTypePattern()
    checkEnumPattern()
    checkPatternGuard()
}
