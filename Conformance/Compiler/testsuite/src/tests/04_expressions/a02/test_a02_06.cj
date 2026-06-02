/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_06

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that loop expression has type and value.
                Tests for-in, while, do-while loops.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

var intArray = [0, 1, 2, 3, 4]

func checkForIn() {
    var cnt = 0
    var unit = for (item in intArray) {
        Assert.equals(cnt, item)
        cnt++
    }
    Assert.isTrue(unit is Unit)
    Assert.equals(5, cnt)
     if(() != unit) { 
        Assert.fail(reason: "Unit should have value ()") 
    }
}
    
func checkWhile() {
    var cnt = 0
    var unit = while (cnt < 5) {
        Assert.equals(intArray[cnt], cnt)
        cnt++
     }
    Assert.isTrue(unit is Unit)
    Assert.equals(5, cnt)
    if(() != unit) { 
        Assert.fail(reason: "Unit should have value ()") 
    }
}
  
func checkDoWhile() {
    var cnt = 0
    var unit = do {
        Assert.equals(intArray[cnt], cnt)
        cnt++
    } while (cnt < 5)
    Assert.isTrue(unit is Unit)
    Assert.equals(5, cnt)
    if(() != unit) { 
        Assert.fail(reason: "Unit should have value ()") 
    }
}

main() {
    checkForIn()
    checkWhile()
    checkDoWhile()
}
