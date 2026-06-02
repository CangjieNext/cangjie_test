/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            01_02_a12_02

  @Level:         1

  @Assertion:       1.2(12) Note: The above scenarios only prohibit the use of a newline character as a separator 
                    between two tokens, it does not mean that newline characters cannot be used in these scenarios 
                    (if a newline character is used, it is directly treated as the end of an expression or 
                    declaration).

  @Description:     Check that when newline characters is not allowed bw  tokens - it can be used as terminator 
                    for function call.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

func myFunc0() {
    "TTT"
}

func myFunc1(a: Int32): Int32 {
    a * 3
}

main() {
    var myFunc0RetVal = myFunc0()


    Assert.equals("TTT", myFunc0RetVal)
    Assert.equals("TTT", myFunc0()
    
    )

}
