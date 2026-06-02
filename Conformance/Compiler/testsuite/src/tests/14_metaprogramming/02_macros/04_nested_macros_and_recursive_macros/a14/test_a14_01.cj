/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_04_a14_01

  @Level:         1

  @Assertion:    14.2.4(14) In the following example, recursive invocation is not supported if the nested macro is not 
                 in the quote expression.

                    public macro A(input: Tokens): Tokens {
                        let tmp = A_part_0(input)
                        if cond {
                            return quote($tmp)
                        }
                        let bb: Tokens = @A(quote($tmp))  // error, recursive macro
                                                        // expression not in quote
                        A_part_1()
                    }

                    main():Int64 {
                        var res: Int64 = @A(2+3)  // error, type mismatch
                        return res
                    }

  @Description:  Check example

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

import aux_macros_01.*

main():Int64 {
    var res: Int64 = @A(2+3)  // error, type mismatch
    return res
}
