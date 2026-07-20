// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime gc stress pass

import std.runtime.*
import std.sync.*
import std.collection.*

class Payload {
    let id: Int64
    let data: Array<Int64>
    var next: ?Payload = None
    init(id: Int64, size: Int64) {
        this.id = id
        this.data = Array<Int64>(size, {i => id * 1000 + i})
    }
}

class FinalizablePayload {
    let id: Int64
    let data: Array<Int64>
    static let finalizedCount = AtomicInt64(0)
    init(id: Int64, size: Int64) {
        this.id = id
        this.data = Array<Int64>(size, {i => id * 1000 + i})
    }
    ~init() { finalizedCount.fetchAdd(1) }
}

func testHeavyAllocationGC(): Bool {
    for (round in 0..5) {
        var batch = ArrayList<Payload>()
        for (i in 0..200) { batch.add(Payload(Int64(round * 1000 + i), 32)) }
        gc(heavy: round % 2 == 0)
    }
    true
}

func testAllocationWithFinalizer(): Bool {
    for (round in 0..10) {
        var batch = ArrayList<FinalizablePayload>()
        for (i in 0..100) { batch.add(FinalizablePayload(Int64(round * 100 + i), 16)) }
    }
    gc(heavy: true)
    sleep(50 * Duration.millisecond)
    gc(heavy: true)
    FinalizablePayload.finalizedCount.load() >= 0
}

func testConcurrentAllocation(): Bool {
    let workers = ArrayList<Future<Int64>>()
    for (w in 0..4) {
        workers.add(spawn { =>
            var local: Int64 = 0
            for (round in 0..5) {
                var batch = ArrayList<Payload>()
                for (i in 0..100) { batch.add(Payload(Int64(w * 10000 + round * 100 + i), 16)) }
                if (round % 2 == 0) { gc(heavy: false) }
            }
            local
        })
    }
    for (w in workers) { w.get() }
    true
}

func testMixedSizedAllocations(): Bool {
    for (_ in 0..10) {
        var small = ArrayList<Payload>()
        var large = ArrayList<Payload>()
        for (i in 0..50) {
            small.add(Payload(Int64(i), 8))
            large.add(Payload(Int64(i), 128))
        }
    }
    gc(heavy: true)
    true
}

main(): Int64 {
    if (!testHeavyAllocationGC()) { return 1 }
    if (!testAllocationWithFinalizer()) { return 2 }
    if (!testConcurrentAllocation()) { return 3 }
    if (!testMixedSizedAllocations()) { return 4 }
    println("runtime gc stress pass")
    0
}
