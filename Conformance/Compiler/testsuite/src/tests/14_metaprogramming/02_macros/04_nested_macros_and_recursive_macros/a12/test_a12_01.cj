/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_04_a12_01

  @Level:         1

  @Assertion:    14.2.4(12) In the following example, if the macro invoked by nesting is displayed in the quote 
                 expression, recursive invocation is supported.

                    public macro A(input: Tokens): Tokens {
                        print("Compiling the macro A ...\n")
                        let tmp = A_part_0(input)
                        if cond {
                            return quote($tmp)
                        }
                        let bb: Tokens = quote(@A(quote($tmp)))  // ok
                        A_part_1()
                    }

                    main():Int64 {
                        var res: Int64 = @A(2+3)  // ok, @A will be treated as Int64
                                                // after macro expand
                        return res
                    }

                 In this example, when macro A is not invoked externally, macro A is not executed (even if it 
                 is invoked internally), that is, Compiling the macro A... is not printed.     
                 if cond is a recursive termination condition. 

  @Description:  Check example

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

  @Issue:        0006252

*/

import utils.assert.Assert
import aux_macros_01.*

main() {
    var res: Int64 = @A(2+3)  // ok, @A will be treated as Int64
                              // after macro expand
    
    Assert.isTrue(res is Int64)
}
