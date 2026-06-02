/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_03_a07_02

  @Level:         1

  @Assertion:    14.2.3(7)
                  // A.cj
                  macro package A
                  public macro M1(input: Tokens) : Tokens {
                      return input
                  }
                    
                  // B.cj
                  package B
                  //public import A.*             // error: macro packages can only be
                                                  // `public import` in macro packages
                  public func F1(input: Int64) : Int64 {
                      return input
                  }

                  // C.cj
                  macro package
                  public import A.*                     // only macro packages can be public
                                                        // import in macro packages
                  // public import B.*                  // error: normal packages can not be
                                                        // public import in macro packages
                  import B.*
                  public macro M2(input:Tokens):Tokens{
                      return @M1(input) + Token(TokenKind.ADD) + quote($(F1(1)))
                  }

  @Description:  Negative check example
  
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: c_01.cj
*/

import c_01.*

main(): Unit {
    var a  = @M2(1)
}
