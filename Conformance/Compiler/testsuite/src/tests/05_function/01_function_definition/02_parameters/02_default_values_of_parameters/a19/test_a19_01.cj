/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a19_01

  @Level:         1

  @Assertion:     5.1.2.2(19) Since parameters and their default values of a function do not belong to the function’s 
                  body, the return expression in the following example lacks its enclosing function body—it belongs to 
                  neither the outer function f (because the definition of the inner function g has started) nor the 
                  inner function g’s body: 
                  func f() { 
                    func g(x! :Int64 = return) { // Error: return must be used inside a function body 
                      0 
                    } 
                    1 
                  } 

  @Description:   Negative example from the spec.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func f() { 
  func g(x! :Int64 = return) { // Error: return must be used inside a function body 
    0 
  } 
  1 
}
main() {
}
