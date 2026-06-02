/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a06_01

  @Level:         1

  @Assertion:    2.3.1(6)
                    main() {
                        var c: Rune = 'a'
                        var num: UInt32 = 0
                        num = UInt32(c) // num = 97
                        num -= 32 // num = 65
                        c = Rune(num) // c = `A`
                        return 0
                    }

  @Description:  Check example

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

main() {
    var c: Rune = r'a'
    var num: UInt32 = 0
    num = UInt32(c) // num = 97
    num -= 32 // num = 65
    c = Rune(num) // c = `A`

    Assert.equals(65, num)
    Assert.equals(r'A', c)

    return 0
}
