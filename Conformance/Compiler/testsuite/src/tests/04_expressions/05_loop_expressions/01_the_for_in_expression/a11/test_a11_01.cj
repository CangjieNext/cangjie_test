/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a11_01

  @Level:         1

  @Assertion: 4.5.1(11)
              main(): Int64 {
                  let intArray: Array<Int32> = [0, 1, 2, 3, 4]
                  for (item in intArray) {
                      print(item) // output: 01234
                  }

                  let intRange = 0..5
                  for (number in intRange where number > 2) {
                      print(number) // output: 34
                  }

                  return 0
              }

  @Description: Check example code
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

var log = "" // added to orig code

main(): Int64 {
    let intArray: Array<Int32> = [0, 1, 2, 3, 4]
        for (item in intArray) {
        print(item) // output: 01234
        log += Rune(b'0' + UInt8(item)).toString() // added to orig code
    }

    let intRange = 0..5
    for (number in intRange where number > 2) {
        print(number) // output: 34
        log += Rune(b'0' + UInt8(number)).toString() // added to orig code
    }

    Assert.equals("0123434", log) // added to orig code
    return 0
}
