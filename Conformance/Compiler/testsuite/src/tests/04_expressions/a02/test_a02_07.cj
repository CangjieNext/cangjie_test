/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_07

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the
              value of an expression is called the evaluation of the expression.
  @Description: Checks that try is an expression and has type and value.
                Test try and tre-with-resources.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

func checkTry() {
    var cnt = 0
    var unit1 = try { 
        cnt++ 
    } catch (_) {}
    Assert.equals(1, cnt)  
    Assert.isTrue(unit1 is Unit)
    if(() != unit1) { 
        Assert.fail(reason: "Unit should have value ()") 
    }

    var unit2 = try { 
        throw Exception() 
    } catch (_) { 
        cnt++ 
    } 
    Assert.equals(2, cnt)  
    Assert.isTrue(unit2 is Unit)
    if(() != unit2) { 
        Assert.fail(reason: "Unit should have value ()") 
    }

    var i3 = try {
        cnt++
        1
    } catch (_) { 
        2
    } 
    Assert.equals(3, cnt)  
    Assert.isTrue(i3 is Int64)
    Assert.equals(1, i3)

    var str = try {
        throw Exception()
    } catch (_) { 
      "catch"
    } 
    Assert.equals(3, cnt)  
    Assert.equals(3, cnt)  
    Assert.isTrue(str is String)
    Assert.equals("catch", str)
}

func checkTryWithResources() {
  var cnt = 0
  var unit1 = try { 
      Assert.equals(0, cnt)
      cnt++
    } catch (_) { 
    } finally {
      Assert.equals(1, cnt)
      cnt++
    }
  Assert.equals(2, cnt)  
  Assert.isTrue(unit1 is Unit)
  if(() != unit1) { Assert.fail(reason: "Unit1 should have value ()") }

  var unit2 = try {
      throw Exception() 
    } catch (_) { 
      Assert.equals(2, cnt)
      cnt++
    } finally {
      Assert.equals(3, cnt)
      cnt++
    }
  Assert.equals(4, cnt)  
  Assert.isTrue(unit2 is Unit)
  if(() != unit2) { Assert.fail(reason: "Unit2 should have value ()") }


  var unit3 = try {
      Assert.equals(4, cnt)
      cnt++
      1
    } catch (_) { 
      2
    } finally {
      Assert.equals(5, cnt)
      cnt++
    }
  Assert.equals(6, cnt)  
  Assert.isTrue(unit3 is Int64)
  Assert.equals(1, unit3)  

  var unit4 = try {
      throw Exception()
    } catch (_) { 
      Assert.equals(6, cnt)
      cnt++
      "catch"
    } finally {
      Assert.equals(7, cnt)
      cnt++
    }
  Assert.equals(8, cnt)  
  Assert.isTrue(unit4 is String)
  Assert.equals("catch", unit4)  
}

main () {
  checkTry()
  checkTryWithResources()
}
