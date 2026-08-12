// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime gc tracing pass

import std.collection.*
import std.ref.*
import std.runtime.*

class TraceNode {
    let id: Int64
    let payload: Array<Int64>
    var next: ?TraceNode = None

    init(id: Int64) {
        this.id = id
        this.payload = Array<Int64>(256, {index => id + Int64(index)})
    }
}

var globalRoot = TraceNode(1000)

func allocateGarbage(seed: Int64): Int64 {
    let garbage = ArrayList<TraceNode>()
    var checksum: Int64 = 0
    for (index in 0..400) {
        let node = TraceNode(seed + Int64(index))
        checksum += node.payload[index % node.payload.size]
        garbage.add(node)
    }
    blackBox(garbage.size)
    return checksum
}

main(): Int64 {
    let first = TraceNode(1)
    let second = TraceNode(2)
    first.next = Some(second)
    second.next = Some(first)
    globalRoot.next = Some(first)

    let roots = Array<TraceNode>(128, {index => TraceNode(Int64(index + 10))})
    for (index in 0..(roots.size - 1)) {
        roots[index].next = Some(roots[index + 1])
    }

    let worker1 = spawn { => allocateGarbage(2000) }
    let worker2 = spawn { => allocateGarbage(4000) }
    let strongWeakTarget = TraceNode(6000)
    let weakRoot = WeakRef<TraceNode>(strongWeakTarget, CleanupPolicy.DEFERRED)
    for (_ in 0..3) {
        gc(heavy: true)
        blackBox(first.id)
        blackBox(roots[64].payload[64])
        blackBox(globalRoot.id)
    }

    match (weakRoot.value) {
        case Some(node) => blackBox(node.id)
        case None => return 4
    }
    weakRoot.clear()
    gc(heavy: true)
    match (weakRoot.value) {
        case Some(_) => return 5
        case None => ()
    }

    let checksum = worker1.get() + worker2.get()
    if (checksum <= 0) {
        return 1
    }
    if (first.next.getOrThrow().id != 2 || second.next.getOrThrow().id != 1) {
        return 2
    }
    if (roots[127].id != 137 || globalRoot.next.getOrThrow().id != 1) {
        return 3
    }

    for (round in 0..4) {
        blackBox(allocateGarbage(Int64(round * 10000)))
        gc(heavy: true)
    }

    println("runtime gc tracing pass")
    return 0
}
