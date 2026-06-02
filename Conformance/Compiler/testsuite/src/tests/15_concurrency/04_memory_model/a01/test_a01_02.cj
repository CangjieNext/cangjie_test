/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_04_a01_02

  @Level:         1
  @Assertion:    15.4(1) The memory model tackles the problem of memory
                 visibility in concurrent programming. It specifies when a
                 write operation on a variable from a thread can be observed
                 by read operations on the same variable from other threads

    • If a data race happens, then its behavior is undefined.

  @Description:  Checks that array memory is safe in case threads write to
                 unique index

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../thread_commons.cj

*/


import std.sync.*  // Atomics
import std.collection.* // HashSet
import utils.assert.Assert
import thread_commons.*

let gAtomicInt:AtomicInt64 = AtomicInt64(0)
var gInt:Int64 = 0
let m:Mutex = Mutex()

func nextIdxAtomic():Int64 {
    return gAtomicInt.fetchAdd(1)
}

func nextIdxInt():Int64 {
    let ret:Int64
    synchronized (m) {
        ret = gInt
        gInt++
    }
    return ret
}

var res:Array<Rune> = []

func foo(id:Rune, iterCount:Int64, nextIdx: () -> Int64): Future<TRes> {
    return spawn {
        var tres:TRes = TRes(id, iterCount)
        for (i in 0..iterCount) {
            let idx = nextIdx()
            // let's read the current value and calculate the new one
            res[idx] = Rune(UInt32(id) + UInt32(res[idx]))
        }

        tres
    }
}

func test(nextIdx: () -> Int64) {
    gAtomicInt.store(0)
    gInt = 0

    let threads = 50
    let iterCount = 200
    let total = threads * iterCount
    res = Array<Rune>(total){i => Rune(0)}

    // start threads
    let charsAllowed = HashSet<Rune>()
    let starter = ThreadStarter<TRes>(threads){i =>
        let char = Rune(UInt32(r'A') + UInt32(i))
        charsAllowed.add(char)
        foo(char, iterCount, nextIdx)
    }

    // wait for results
    let results = starter.waitAll()

    var corrupted:Bool = total != res.size
    try {
        for (char in res) {
            corrupted = corrupted || !charsAllowed.contains(char)
            if (corrupted) {
                break
            }
        }
    } catch (e:IllegalArgumentException) {
        corrupted = true
    }
    Assert.isFalse(corrupted, reason: "Rune array should NOT be corrupted")
}

main(): Int64 {
    test({ => nextIdxAtomic()})
    test({ => nextIdxInt()})

    return 0
}
