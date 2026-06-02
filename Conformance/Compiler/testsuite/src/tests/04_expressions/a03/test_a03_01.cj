/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a03_01

  @Level:         1
  @Assertion: 4(3): In the Cangjie programming language, expressions are almost
              ubiquitous, including expressions for various calculations (such 
              as arithmetic expressions, logical expressions, etc.), branches 
              and loops (such as if expressions, loop expressions, etc.).  
  @Description: Checks that arithmetic, logical, branches and loops expressions 
                are supported in Cangjie.
  @Comment: This assertion is also well-covered by the tests of assertions 4(2)
            and 4(4).
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

let i: Int64 = Assert.getRuntimeZero()
let j = 28
var k = 1
let b: Bool = true

let arr : Array<Int64> = [72, 101, 108, 108, 111]

main() {
    var x: Int64 = i * ((j + k) / 14) % 2 + arr[2]
    Assert.equals(108, x)

    if(x < 0) {
        Assert.fail(reason: "Should not reach here")
    } else if(x == 108) {
        x++
    } else {
        Assert.fail(reason: "Should not reach here")
    }

    var unit = for (item in arr) {
        k += item
    }
    Assert.equals(501, k)

    while (k > 5) {
        k = k - x
    }
    Assert.equals(-44, k)

    do {
        k *= -1
    } while(k < 0)
    Assert.equals(44, k)

    Assert.isFalse(!b)
    Assert.isTrue(b && (i > 0) || (j < 100))
}

