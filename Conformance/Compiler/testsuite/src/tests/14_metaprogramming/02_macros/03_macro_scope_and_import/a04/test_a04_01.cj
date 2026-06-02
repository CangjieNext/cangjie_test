/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_03_a04_01

  @Level:         1

  @Assertion:    14.2.3(4)
                  //define.cj
                  macro package define       // modify package with macro
                  import ast.*
                  // public func A() {}      // error: func A can not be modified by `public`
                  public macro M(input: Tokens): Tokens {    // only macros can be modified
                                                            // by `public`
                    return input
                  }

                  // call.cj
                  package call
                  import define.*
                  func main(){
                      @M()
                      return 0
                  }

  @Description:  Postive check example
  
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: define.cj

  @Issue:        6219
*/

package call
import define.*

main(){
    @M()
    return 0
}
