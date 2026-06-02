/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_31

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that composite expressions have type and value.
                Test cases include loops, ranges, control flow expressions, etc.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

func return15(): Int64 {
    15
}

func getPi(): Float64 {
    3.14
}

var i: Int64 = 15
var j = 2
var k = 134
let c: Rune = 'c'
let b: Bool = true

let str: String = "Hello"
let arrI8: Array<UInt8> = [72, 101, 108, 108, 111]

main() {

    var sum = 0
    var unit1 = for (item in arrI8) {
        sum++
        if(getPi() == 3.14) {
            while(k != 134) {
                do {
                    k--
                } while(k >= 150)
            }
        } else if (getPi() > 3.14) {
            i++ 
        } else {
            j--
        }
    }
    Assert.equals(5, sum)
    Assert.isTrue(unit1 is Unit) 
    if(() != unit1) {
        Assert.fail(reason: "Unit1 should have value ()") 
    }

    var unit2 = for (item in [1..10 : 2]) {
        sum++
        if(getPi() == 3.14) {
            continue 
        } else if(i < 0) {
            j += 128
        } else if (j == k) {
            while(k != 134) {
                do {
                    if(k == 136) {
                        break
                    }
                    k--
                } while(k >= 150)
            }
        } else if (getPi() > 3.14) {
            i *= 14
        } else {
            j %= k
        }
    }
    Assert.equals(6, sum)
    Assert.isTrue(unit2 is Unit) 
    if(() != unit2) {
        Assert.fail(reason: "Unit2 should have value ()") 
    }

}
