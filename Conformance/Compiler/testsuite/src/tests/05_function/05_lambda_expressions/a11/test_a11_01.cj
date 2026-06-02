/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a11_01

  @Level:         1

  @Assertion:       5.5(11)
                    var sum1: (Int32, Int32) -> Int32 = {a, b => a + b} 
                    var sum2: (Int32, Int32) -> Int32 = {a: Int32, b => a + b} 
                    var display = { => print("Hello") } 
                    var a = { => return 1 } 

  @Description:     Positive examples from spec

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

main() {
    var sum1: (Int32, Int32) -> Int32 = {a, b => a + b} 
    var sum2: (Int32, Int32) -> Int32 = {a: Int32, b => a + b} 
    var display = { => print("Hello") } 
    var a = { => return 1 } 

    Assert.equals(9, sum1(2, 7))
    Assert.equals(4, sum2(0, 4))
    Assert.equals(1, a())
}
