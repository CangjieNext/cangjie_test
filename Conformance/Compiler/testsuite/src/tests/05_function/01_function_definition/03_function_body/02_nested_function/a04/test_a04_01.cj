/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_03_02_a04_01

  @Level:         1

  @Assertion:     5.1.3.2(4)
                  func foo(): Unit { 
                    func add(a: Int32, b: Int32) { a + b } 
                    let c = 1 
                    func nest(): Unit { 
                      print("${c}")             // 1 
                      var b = add(1, 2)     // b = 3 
                    } 
                  } 

  @Description:   Positive examples from the spec.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func foo(): Unit { 
  func add(a: Int32, b: Int32) { a + b } 
  let c = 1 
  func nest(): Unit { 
    print("${c}")             // 1 
    Assert.equals(1, c)
    var b = add(1, 2)     // b = 3 
    Assert.equals(3, b)
  }
  nest() 
} 

main() {
}
