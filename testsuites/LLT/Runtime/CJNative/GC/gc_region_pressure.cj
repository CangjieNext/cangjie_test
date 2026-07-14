// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run env cjHeapSize=64MB %run_opt %output %run_args 2>&1 | compare %f
// (not Windows) RUN-EXEC-PIPE: %run env cjHeapSize=64MB cjPinnedRegionSize=16kb cjLargeThresholdSize=64kb %run_opt %output %run_args 2>&1 | compare %f
// (not Windows) RUN-EXEC-PIPE: %run env cjHeapSize=64MB cjPinnedRegionSize=1kb cjLargeThresholdSize=2kb %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime region pressure pass

import std.collection.*
import std.runtime.*

class RegionPayload {
    let id: Int64
    let bytes: Array<UInt8>

    init(id: Int64, size: Int64) {
        this.id = id
        this.bytes = Array<UInt8>(size, repeat: UInt8(id % 251))
    }
}

func allocateBatch(round: Int64): ArrayList<RegionPayload> {
    let batch = ArrayList<RegionPayload>()
    for (index in 0..320) {
        batch.add(RegionPayload(round * 10000 + Int64(index), 1024))
    }
    for (index in 0..48) {
        batch.add(RegionPayload(round * 10000 + 1000 + Int64(index), 64 * 1024))
    }
    for (index in 0..4) {
        batch.add(RegionPayload(round * 10000 + 2000 + Int64(index), 1024 * 1024))
    }
    return batch
}

main(): Int64 {
    var longLived = ArrayList<RegionPayload>()
    var checksum: Int64 = 0

    for (round in 0..7) {
        let batch = allocateBatch(Int64(round))
        let retained = ArrayList<RegionPayload>()
        for (index in 0..batch.size) {
            if (index % 17 == round % 17) {
                retained.add(batch[index])
                checksum += batch[index].id + Int64(batch[index].bytes[0])
            }
        }
        longLived = retained
        gc(heavy: round % 2 == 0)
        blackBox(longLived.size)
        if (longLived.isEmpty()) {
            return 1
        }
    }

    let lastId = longLived[longLived.size - 1].id
    longLived = ArrayList<RegionPayload>()
    for (_ in 0..4) {
        blackBox(allocateBatch(100).size)
        gc(heavy: true)
    }
    if (checksum <= 0 || lastId <= 0) {
        return 2
    }
    println("runtime region pressure pass")
    return 0
}
