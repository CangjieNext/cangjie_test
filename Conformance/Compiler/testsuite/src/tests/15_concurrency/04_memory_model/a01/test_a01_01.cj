/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_04_a01_01

  @Level:         1
  @Assertion:    15.4(1) The memory model tackles the problem of memory
                 visibility in concurrent programming. It specifies when a
                 write operation on a variable from a thread can be observed
                 by read operations on the same variable from other threads

    • If a data race happens, then its behavior is undefined.

  @Description:  Checks that 50 threads simultaneously writing to the string
                 will corrupt it

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../thread_commons.cj

*/


import std.collection.* // HashSet
import utils.assert.Assert
import thread_commons.*
import std.sync.*

var res:String = ""
let mtx = Mutex()

func foo(id:Rune, iterCount:Int64): Future<TRes> {
    return spawn {
        let tres:TRes = TRes(id, iterCount)
        for (i in 0..iterCount) {
            synchronized(mtx) {
                res += id.toString()
            }
        }

        return tres
    }
}

main(): Int64 {
    let threads = 50
    let iterCount = 200
    let total = threads * iterCount

    // start threads
    let charsAllowed = HashSet<Rune>()
    let starter = ThreadStarter<TRes>(threads){i =>
        let char = Rune(UInt32(r'A') + UInt32(i))
        charsAllowed.add(char)
        foo(char, iterCount)
    }

    // wait for results
    let results = starter.waitAll()

    var corrupted:Bool = total != res.size
    try {
        for (char in res.toRuneArray()) {
            corrupted ||= !charsAllowed.contains(char)
            if (corrupted) {
                break
            }
        }
    } catch (e:IllegalArgumentException) {
        corrupted = true
    }
    Assert.isTrue(!corrupted, reason: "String should be corrupted")

    return 0
}
