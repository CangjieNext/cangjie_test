/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_a03_01

  @Level:         1
  @Assertion:    15.1(3) • Thread will be suspended when it is blocked

  @Description:  Checks that blocked thread is suspended

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../thread_commons.cj

*/
import std.sync.*  // Mutex
import utils.assert.*
import thread_commons.*

let m = Mutex()
var boolVar = false

func foo(): Future<Bool> {
    return spawn {
        synchronized(m) {
            boolVar = true
        }
        true
    }
}

main(): Int64 {
    m.lock()

    let t = foo()

    try {
        t.get(Duration.nanosecond * LONG_TIMEOUT)  // wait for 3 seconds
    } catch (e: TimeoutException) {
        println(e)
    }
    Assert.isFalse(boolVar, reason: "Boolean variable shouldn't be changed")
    m.unlock()
    var res = t.get()
    Assert.isTrue(res, reason: "The result should be available")
    Assert.isTrue(boolVar, reason: "Boolean variable should be changed")
    0
}
