/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         data_race_helper

  @Level:         1

  @Description:  Helper functions for data race testing

  @Structure:    complex-aux
*/
package data_race

import std.collection.* // HashSet
import std.sync.*  // Concurrency
import std.time.* // Duration

import thread_commons.*

public class DataRaceHelper<V> where V <: Hashable & Equatable<V> & ToString {
    private let threads:Int64
    private let iterCount:Int64
    private let m:Monitor = Monitor()
    private let amount:AtomicInt64 = AtomicInt64(0)
    public let total:Int64
    public let valuesAllowed = HashSet<V>()
    public var allowed = ""

    public init(threads:Int64, iterCount:Int64) {
        this.threads = threads
        this.iterCount = iterCount
        this.total = threads * iterCount
    }

    public func check(
            getId:(Int64)-> V,
            modify:(V, Int64) -> Unit,
            verify:(Array<V>) -> Unit) {

        // start threads
        let starter = ThreadStarter<V>(threads){i =>
            let id = getId(i)
            valuesAllowed.add(id)
            return spawn {
                synchronized(m) {
                    amount.fetchAdd(1)
                    m.wait()
                }
                for (i in 0..iterCount) {
                    modify(id, i)
                }

                return id
            }
        }
        while (amount.load() < threads) {
            sleep(Duration.nanosecond * 50)
        }
        sleep(Duration.nanosecond * 300_000) // wait enough
        allowed = "${valuesAllowed}"
        synchronized(m) {
            m.notifyAll()
        }

        // wait for results
        let results = starter.waitAll()

        verify(results)
    }
}
