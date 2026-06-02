
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_01_a05_01

  @Level:         1

  @Assertion:   4.7.1(5) For example, the following program outputs 12 is divisible by both 4 and 6 five times, along
                with the value of i each time.
                main(): Int64 {
                    var index: Int64 = 0 
                    for (i in 0..5) {
                        index = i
                        while (index < 20) { 
                            index = index + 1
                            if ((index % 4 == 0) && (index % 6 == 0)) { 
                                print("${index} is divisible by both 4 and 6") 
                                break
                        }
                        }
                        print("${i}th test")
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
    var innerOutputCount = 0
    var outerOutputCheck = ""

    var index: Int64 = 0
    for (i in 0..5) {
        index = i
        while (index < 20) { 
            index = index + 1
            if ((index % 4 == 0) && (index % 6 == 0)) { 
                print("${index} is divisible by both 4 and 6") 
                innerOutputCount++
                break
        }
        }
        print("${i}th test")
        outerOutputCheck += i.toString() + " "
    }

    Assert.equals(5, innerOutputCount)
    Assert.equals("0 1 2 3 4 ", outerOutputCheck)
    return 0
}