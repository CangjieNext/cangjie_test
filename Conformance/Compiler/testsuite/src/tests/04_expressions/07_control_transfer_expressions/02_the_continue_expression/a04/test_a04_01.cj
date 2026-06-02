
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_02_a04_01

  @Level:         1

  @Assertion:   4.7.2(4) In the following example, all the numbers between 1 and 49 that can be simultaneously divided
                by 4 and 6 (i.e., 12, 24, 36 and 48) are printed in one message and the remaining numbers are printed
                in a different message.
                main(): Int64 {
                    var index: Int32 = 0 
                    while (index < 50) {
                        index = index + 1
                        if ((index % 4 == 0) && (index % 6 == 0)) { 
                            print("${index} is divisible by both 4 and 6") 
                            continue 
                        }
                        print("${index} is not what we want")
                    }
                    return 0
                }
  @Description: Checks the given example. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main(): Int64 {
    var innerLoopCheck = ""
    var outerLoopCheck = ""

    var index: Int32 = 0 
    while (index < 50) {
        index = index + 1
        if ((index % 4 == 0) && (index % 6 == 0)) { 
            print("${index} is divisible by both 4 and 6") 
            innerLoopCheck += index.toString() +  " "
            continue 
        }
        print("${index} is not what we want")
        outerLoopCheck += index.toString() + " "
    }

    Assert.equals("12 24 36 48 ", innerLoopCheck)
    var expected = "1 2 3 4 5 6 7 8 9 10 11 13 14 15 16 17 18 19 20 21 22 23 25 26 27 28 29 30 31 32 "
    expected += "33 34 35 37 38 39 40 41 42 43 44 45 46 47 49 50 "
    Assert.equals(expected, outerLoopCheck)
    return 0
}