/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_06_a05_01

  @Level:         1

  @Assertion: 4.6(5)
              The primary use of ordinary try expression is error handling, see Chapter Exceptions for details.

  @Description: Check the ordinary try expression example.

  @Mode: run

  @Negative: no

*/

// NOTE: Ordinary try expressions should be well tested within "Exceptions" chapter. No need to duplicate tests here.
//       Just provide an example.

import utils.assert.Assert

func foo(x : Int64, y : Int64) : Int64 {
  return x ** UInt64(y)
}

main() {
    var caught = false
    var arr = [1, 2, 3, 4, 5]
    try {
        var x = 2
        var y = 3
        var z = foo(x, y)
        var v = arr[z]
    } catch (e: Exception) {
        caught = true
    }
    Assert.isTrue(caught)
}

