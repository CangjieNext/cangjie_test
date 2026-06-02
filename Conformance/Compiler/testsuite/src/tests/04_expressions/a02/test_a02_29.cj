/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_29

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that composite expressions have type and value.
                Tests type conversion and check expressions.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

let arrI8 : Array<UInt8>  = [72, 101, 108, 108, 111]

var i: Int64   = 15
var j = 2
var k = 134
let f: Float64 = 3.14  
let c: Rune = 'c'
let b: Bool = true

func getme(x: Int64): Int64 {
    x
}

func getF(f: Float64): Float64 {
    f
}

func getTrue(b: Bool): Bool {
    b
}

main() {
    Assert.isTrue(Float64(Float32(Int64(Int32(Int16(Int8(arrI8[0])))))) is Float64)
    
    Assert.equals(72.0, Float64(Float32(Int64(Int32(Int16(Int8(arrI8[0])))))))

    Assert.isTrue((getme(i) is Int64 && getme(j) is Int64 && getme(k) is Int64) is Bool)
    Assert.isTrue((getF(f) is Float64) && getTrue(b) && (c is Rune) is Bool)

    Assert.isTrue(
        (getme(i + 14) is Int64 && j is Int64 && getme(k - 7) is Int32) || 
        (getF(f) is Float64) && getTrue(b) && (c is Rune))
} 
