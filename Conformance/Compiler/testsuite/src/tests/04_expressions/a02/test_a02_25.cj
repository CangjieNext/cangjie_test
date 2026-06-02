/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_25

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that composite expressions have type and value.
                Test cases include literals, variable names, function names and calls, 
                conditional expressions, loops, paranthesized expressions, etc.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

func return15(): Int64 { 
    15 
}

func returnTrue(b: Bool): Bool {
    !b   
}

var i: Int64 = 15
var j = 2
var k = 134
let f: Float64 = 3.14
let c: Rune = 'c'

let str: String = "Hello"
let arrI8: Array<UInt8> = [72, 101, 108, 108, 111]

main() {
    var s = str + " " + "there"
    Assert.isTrue(s is String)
    Assert.equals("Hello there", s)

    var x = (i + ((j - k) * 12) % 4 + 
        Int64(arrI8[2]) - 
        return15() + 
        if(returnTrue(false)) { 
            100 
        } else { 
            50 
        })
    Assert.isTrue(x is Int64)
    Assert.equals(208, x)
}
