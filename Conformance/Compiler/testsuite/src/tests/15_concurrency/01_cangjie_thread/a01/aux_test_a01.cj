/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         aux_15_01_a01

  @Level:         1

  @Description:  Contains parametrized test body to test that multiple threads
                 will interrupt each other

  @Structure:    complex-aux
  @Dependencies: ../../thread_commons.cj
*/

import std.sync.*  // Atomics
import std.collection.* // HashSet
import utils.assert.Assert
import thread_commons.*

var gi:AtomicInt64 = AtomicInt64(0)

var res:Array<Rune> = []

func foo(id:Rune, iterCount:Int64): Future<TRes> {
    return spawn {
        var tres:TRes = TRes(id, iterCount)
        for (i in 0..iterCount) {
            tres.chars += id.toString()
            res[gi.fetchAdd(1)] = id
        }

        tres
    }
}

public func test_body(threads:Int64, iterCount:Int64): Int64 {
    let total = threads * iterCount

    res = Array<Rune>(total){i => Rune(0)}

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
    for (tres in results) {
        tres.validate()
        // Catch the case if whole string like "aa...aa" appears in result sequence.
        // It means a thread wasn't interrupted.
        match (str.indexOf(tres.chars)) {
            case Some(idx) => println("${tres.id} -> ${idx}")
            case None => someInterrupted = true
        }
    }
    Assert.isTrue(someInterrupted, reason: "At least some threads should be interrupted")
    Assert.equals(total, res.size, reason: "Array size should match")
    Assert.equals(total, str.size, reason: "String size should match")
    0
}
