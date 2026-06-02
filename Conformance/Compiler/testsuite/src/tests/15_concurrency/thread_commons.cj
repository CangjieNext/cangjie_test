/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         thread_commons

  @Level:         1

  @Description:  Helper functions for concurrent tests

  @Structure:    complex-aux
*/
package thread_commons

import std.time.DateTime
import utils.assert.Assert
import std.random.Random

public class ThreadStarter<T> {
    private let arr:Array<Future<T>>

    public init(threadCount:Int64, fn: (Int64)->Future<T>) {
        arr = Array<Future<T>>(threadCount){i => fn(i)}
    }

    public init(arr:Array<Future<T>>) {
        this.arr = arr
    }

    public func waitAll():Array<T> {
        Array<T>(arr.size){i => arr[i].get()}
    }
}

public struct TRes {
    public let id:Rune
    public let iterCount:Int64

    public let begin:Int64
    public var end:Int64 = -1
    public var chars:String = ""

    public init(id:Rune, iterCount:Int64) {
        this.id = id
        this.iterCount = iterCount
        this.begin = nanoTime()
    }

    public func validate() {
        Assert.equals(iterCount, chars.size, reason: "${id}-string size should match")
        for (i in 0..chars.size) {
            Assert.equals(id, chars.toRuneArray()[i], reason: "Chars should contain only '${id}' chars")
        }
    }
}

public func nanoTime():Int64 {
    return DateTime.now().toUnixTimeStamp().toNanoseconds()
}

public func measure<T>(f: () -> T):(T, Int64) {
    let begin = nanoTime()
    return (f(), nanoTime() - begin)
}

public let LONG_TIMEOUT:Int64 = 3_000_000_000

let rnd = Random()
public let RANDOM_TIMEOUT:Int64 = 10_000 + Int64(rnd.nextUInt64(1_000_000))
