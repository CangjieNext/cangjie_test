/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_08

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that control transfer expression has type and value.
                Tests break, continue, return, throw.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: Ignore

*/

import utils.assert.Assert

var retCount: Int64 = 0

func checkBreak() {
    var cnt = 0
    for (i in 0..5) {
        cnt++
        var unit: Unit = break  // We only can check that break can be assigned.
    }
    Assert.equals(1, cnt)       // really break executed
}

func checkContinue() {
    var i = 0
    var cnt = 0
    do {
        i++
        if(i == 3) {
        cnt++
        var unit: Unit = continue    // We only can check here that continue can be assigned.
    }
    } while(i < 5)
    Assert.equals(1, cnt) // really continue executed
}
  
func tryme() {
    retCount++
    var retUnit: Unit = return       // We only can check here that return can be assigned.
}

func checkReturn() {
    tryme()
    Assert.equals(1, retCount)
}
  
func checkThrow() {
    var thrown = false
    try {
        var unit: Unit = throw Exception() // We only can check here that throw can be assigned.
    } catch (_) { 
        thrown = true   
    } 
    Assert.isTrue(thrown)
}

main() {
    checkBreak()
    checkContinue()
    checkReturn()
    checkThrow()
}
