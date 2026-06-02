/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         aux_15_01_a02

  @Level:         1
  @Assertion:    15.1(2)  • Multiple threads execute concurrently.

  @Description:  Contains parametrized test body to test that multiple threads
                 will run concurrently

  @Structure:    complex-aux
  @Dependencies: ../../thread_commons.cj
*/

import std.sync.*  // Atomics
import std.math.*  // min/max
import std.collection.* // HashSet
import utils.assert.Assert
import thread_commons.*

var gi:AtomicInt64 = AtomicInt64(0)

var res:Array<Rune> = []

func debug(str: String) {
    // no-op
    println(str)
}

func foo(id:Rune, iterCount:Int64): Future<TRes> {
    return spawn {
        var tres:TRes = TRes(id, iterCount)
        for (i in 0..iterCount) {
            tres.chars += id.toString()
            res[gi.fetchAdd(1)] = id
        }
        tres.end = nanoTime()

        tres
    }
}

public func test_body(threads:Int64, iterCount:Int64): Int64 {
    let total = threads * iterCount

    res = Array<Rune>(total){i => Rune(0)}

    let now = nanoTime()
    // start threads
    let charsAllowed = HashSet<Rune>()
    let starter = ThreadStarter<TRes>(threads){i =>
        let char = Rune(UInt32(r'a') + UInt32(i))
        charsAllowed.add(char)
        foo(char, iterCount)
    }

    // wait for results
    let results = starter.waitAll()

    for (char in res) {
        Assert.isTrue(charsAllowed.contains(char), reason: "Unexpected character in result")
    }
    let str = String(res)
    // letters will be mixed in case threads interrupts each other
    var someInterrupted = false
    var lBound = Int64.Min
    var rBound = Int64.Max
    for (tres in results) {
        tres.validate()
        // Catch the case if whole string like "aa...aa" appears in result sequence.
        // It means a thread wasn't interrupted.
        match (str.indexOf(tres.chars)) {
            case Some(idx) => println("${tres.id} -> ${idx}")
            case None => someInterrupted = true
        }
        lBound = max(lBound, tres.begin)
        rBound = min(rBound, tres.end)

        debug("Thread [${tres.id}] -> (${tres.begin - now}, ${tres.end - now})")
    }
    debug("Bounds ${lBound - now}, ${rBound - now}")
    Assert.isTrue(someInterrupted, reason: "At least some threads should be interrupted")
    Assert.equals(total, res.size, reason: "Array size should match")
    Assert.equals(total, str.size, reason: "String size should match")
    Assert.isTrue(rBound > lBound, reason: "Threads should be executed same time")
    0
}
