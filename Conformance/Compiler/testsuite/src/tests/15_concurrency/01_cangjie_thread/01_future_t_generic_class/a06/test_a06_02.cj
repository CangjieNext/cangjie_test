/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_01_a06_02

  @Level:         1
  @Assertion:    15.1.1(6) If the thread corresponding to the Future<T> object
                 terminates due to an exception, an exception will be thrown
                 when calling get().  E.g.

  @Description:  Checks that Exception happen in the thread will be thrown when
                 calling get()

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006115,0006505

*/

import utils.assert.Assert

main(args:Array<String>): Int64 {
    let f = spawn {
        // this check is required to pass compilation
        if (args.size != -1) {
            throw Exception("Expected Exception in thread")
        }
    }

    try {
        f.get()
        Assert.fail()
    } catch (e:Exception) {
        Assert.equals("Expected Exception in thread", e.message)
        Assert.pass()
    }
    1
}
