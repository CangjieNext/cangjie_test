/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_05_a01_01

  @Level:         1
  @Assertion:    15.3.5(1) The synchronized keyword and a ReentrantMutex
                 object can be used to protect a code block that follows, so
                 that only one thread is allowed to execute the code in that
                 block at a time.

  @Description:  Checks that only one thread can execute code in synchronized
                 block

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../thread_commons.cj

*/

import std.sync.*  // Concurrency
import std.time.* // Duration
import std.sort.*

import utils.assert.Assert
import thread_commons.*

let m = Mutex()

func foo(id:Rune): Future<TRes> {
    return spawn {
        var tres:TRes
        synchronized (m) {
            tres = TRes(id, 0)
            sleep(Duration.nanosecond * 1000)
            tres.end = nanoTime()
        }
        tres
    }
}

main(): Int64 {
    let threads = 10
    let starter = ThreadStarter<TRes>(threads){i =>
        let char = Rune(UInt32(r'a') + UInt32(i))
        foo(char)
    }

    // wait for results
    let results = starter.waitAll()

    sort(results, by: {tres1, tres2 =>
        let diff = tres1.begin - tres2.begin
        if (diff < 0) {
            return Ordering.LT
        }
        if (diff > 0) {
            return Ordering.GT
        }
        return Ordering.EQ
    })

    var prev:Option<TRes> = Option.None;
    for (tres in results) {
        match (prev) {
            case Some(v) => Assert.isTrue(v.end < tres.begin,
                        reason: "Intervals should'n intersect each other")
            case None => () // no-op
        }
        prev = Option.Some(tres);
    }

    return 0
}
