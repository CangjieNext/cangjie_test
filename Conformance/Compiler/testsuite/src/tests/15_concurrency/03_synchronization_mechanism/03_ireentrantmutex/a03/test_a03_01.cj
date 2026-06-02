/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_03_a03_01

  @Level:         1
  @Assertion:    15.3.3(3) Note:
                 1. It is a responsibility of the implementor to guarantee that
                 the underlying mutex actually  supports nested locking.

  @Description:  Checks that dumb implementation of IReentrantMutex locks
                 nothing

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../dumb_mutex.cj ../../../thread_commons.cj

  @CompileWarning: no

*/
import utils.assert.Assert
import thread_commons.*

let m = DumbMutex()
var boolVar = false

func foo(): Future<Bool> {
    return spawn {
        m.lock() // mutex already locked, but DumbMutex will not be locked

        boolVar = true
        true
    }
}

main(): Int64 {
    m.lock()

    let t = foo()

    var res = t.get(Duration.nanosecond * LONG_TIMEOUT) // wait for 3 seconds
    Assert.isSome(res, reason: "The result should be available")
    Assert.isTrue(boolVar, reason: "Boolean variable should be changed")

    0
}
