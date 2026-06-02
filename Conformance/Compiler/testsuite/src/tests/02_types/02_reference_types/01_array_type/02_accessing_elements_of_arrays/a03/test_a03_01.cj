/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_02_a03_01

  @Level:         1
  @Assertion:    2.2.1.2(3) Iterative access to elements in arr through for-in
                 expression (see Chapter Expressions).

  @Description:  Checks that array elements can be accessed iteratively using
                 for-in loop

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/
import utils.assert.*

main(): Int64 {
    let size = 15
    let a = Array<Int64>(size) { i => 1 << i }

    var i = 0;
    for (e in a) {
        Assert.equals(1 << i, e)
        i++
    }

    return 0
}
