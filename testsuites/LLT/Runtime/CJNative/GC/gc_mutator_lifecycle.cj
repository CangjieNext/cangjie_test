// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime mutator lifecycle pass

import std.collection.*
import std.runtime.*
import std.sync.*

class MutatorObject {
    let id: Int64
    let payload: Array<Int64>
    var next: ?MutatorObject = None

    init(id: Int64) {
        this.id = id
        this.payload = Array<Int64>(128, {index => id + Int64(index)})
    }
}

let completedMutators = AtomicInt64(0)

func allocationWave(seed: Int64): Int64 {
    let roots = ArrayList<MutatorObject>()
    var checksum: Int64 = 0
    for (round in 0..8) {
        for (index in 0..160) {
            let node = MutatorObject(seed + Int64(round * 1000 + index))
            checksum += node.payload[index % node.payload.size]
            if (index % 5 == 0) {
                if (!roots.isEmpty()) {
                    node.next = Some(roots[roots.size - 1])
                }
                roots.add(node)
            }
        }
        gc(heavy: round % 3 == 0)
        blackBox(roots.size)
        blackBox(roots[roots.size - 1].id)
    }
    completedMutators.fetchAdd(1)
    return checksum + Int64(roots.size)
}

func nestedMutator(seed: Int64): Int64 {
    let child = spawn { => allocationWave(seed + 100000) }
    let local = allocationWave(seed)
    return local + child.get()
}

main(): Int64 {
    let futures = ArrayList<Future<Int64>>()
    for (index in 0..6) {
        futures.add(spawn { => nestedMutator(Int64(index * 1000000 + 1)) })
    }

    var checksum: Int64 = 0
    for (future in futures) {
        checksum += future.get()
    }
    gc(heavy: true)

    if (checksum <= 0 || completedMutators.load() != 12) {
        return 1
    }
    println("runtime mutator lifecycle pass")
    return 0
}
