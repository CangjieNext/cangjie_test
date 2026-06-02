/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a17_01

  @Level:         1

  @Assertion:     5.1.2.2(17)
                  /* The names introduced in the default value, does not need to have the same or least  restrictive 
                  accessibility of the function. */ 
                  var x = 10 
                  var y = 10 
                  func g() {} 
                  public func f2(a!: Int64 = x * 2 + y, b!: ()->Unit = g) {}             // OK. 
                  class AAA { 
                    static private var x = 10 
                    func f(a!: Int64 = x) { // OK, public method can use private static field. 
                      print("${a}") 
                      x = x + 10 
                      print("${x}") 
                    } 
                  } 

  @Description:   Positive examples from the spec.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/

var x = 10 
var y = 10 

func g() {} 

public func f2(a!: Int64 = x * 2 + y, b!: ()->Unit = g) {}             // OK. 

class AAA { 
  static private var x = 10 

  func f(a!: Int64 = x) { // OK, public method can use private static field. 
    print("${a}") 
    x = x + 10 
    print("${x}") 
  } 
}  

main() {
}
