/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_04_a05_01

  @Level:         1

  @Assertion:     5.1.4(5)
                  class A {} 
                  class B <: A {} 
                  // Return is not written. 
                  func add(a: Int32, b: Int32): B { 
                    var c = a + b 
                    if (c > 100) { 
                      return B() 
                    } else { 
                      return A() // Compilation error since A is not a subtype of B. 
                    } 
                  }

  @Description:   Negative example from the spec.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

class A {} 

class B <: A {} 

// Return is not written. 

func add(a: Int32, b: Int32): B { 
  var c = a + b 
  if (c > 100) { 
    return B() 
  } else { 
    return A() // Compilation error since A is not a subtype of B. 
  } 
}

main() {
}
