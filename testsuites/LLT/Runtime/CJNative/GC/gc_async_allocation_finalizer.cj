// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run env cjHeapSize=64MB cjEnableAsyncAllocation=0 %run_opt %output %run_args 2>&1 | compare %f
// (not Windows) RUN-EXEC-PIPE: %run env cjHeapSize=64MB cjEnableAsyncAllocation=1 %run_opt %output %run_args 2>&1 | compare %f
// (not Windows) RUN-EXEC-PIPE: %run env cjHeapSize=64MB cjEnableAsyncAllocation=x %run_opt %output %run_args 2>&1 | compare %f
// (not Windows) RUN-EXEC-PIPE: %run env cjHeapSize=64MB cjEnableAsyncAllocation=xx %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime async allocation finalizer pass

import std.collection.*
import std.runtime.*
import std.sync.*

let asyncFinalized = AtomicInt64(0)

class AsyncFinalizablePayload {
    let id: Int64
    let bytes: Array<UInt8>

    init(id: Int64) {
        this.id = id
        this.bytes = Array<UInt8>(512, repeat: UInt8(id % 251))
    }

    ~init() {
        asyncFinalized.fetchAdd(1)
    }
}

func allocateOnWorker(worker: Int64): Int64 {
    var checksum: Int64 = 0
    for (round in 0..24) {
        let batch = ArrayList<AsyncFinalizablePayload>()
        for (index in 0..480) {
            let value = AsyncFinalizablePayload(worker * 1000000 + Int64(round * 1000 + index))
            checksum += value.id + Int64(value.bytes[0])
            batch.add(value)
        }
        blackBox(batch.size)
        if (round % 3 == 0) {
            gc(heavy: round % 6 == 0)
        }
    }
    return checksum
}

main(): Int64 {
    let worker1 = spawn { => allocateOnWorker(1) }
    let worker2 = spawn { => allocateOnWorker(2) }
    let worker3 = spawn { => allocateOnWorker(3) }
    let worker4 = spawn { => allocateOnWorker(4) }
    let checksum = worker1.get() + worker2.get() + worker3.get() + worker4.get()

    for (attempt in 0..80) {
        gc(heavy: attempt % 2 == 0)
        sleep(2 * Duration.millisecond)
        if (asyncFinalized.load() >= 256) {
            break
        }
    }
    if (checksum <= 0 || asyncFinalized.load() < 256) {
        return 1
    }
    println("runtime async allocation finalizer pass")
    return 0
}
