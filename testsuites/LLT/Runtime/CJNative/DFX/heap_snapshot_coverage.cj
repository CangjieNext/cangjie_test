// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run env DumpStackDepth=64 %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime heap snapshot coverage pass

import std.fs.*
import std.runtime.*
import std.sync.*

foreign func CJ_MCC_DumpCJHeapData(fd: Int32): Bool
foreign func CJ_MRT_DumpHeapSnapshot(fd: Int32): Unit

let snapshotFinalizerStarted = AtomicInt64(0)

class SnapshotNode {
    let id: Int64
    var next: ?SnapshotNode
    let payload: Array<UInt8>

    init(id: Int64) {
        this.id = id
        this.next = None
        this.payload = Array<UInt8>(32, repeat: UInt8(id % 251))
    }

    init(id: Int64, next: ?SnapshotNode) {
        this.id = id
        this.next = next
        this.payload = Array<UInt8>(32, repeat: UInt8(id % 251))
    }
}

class SnapshotBlockingFinalizer {
    let node = SnapshotNode(9000)

    ~init() {
        snapshotFinalizerStarted.store(1)
    }
}

struct SnapshotRecord {
    let value: Int32
    let node: ?SnapshotNode

    init(value: Int32, node: ?SnapshotNode) {
        this.value = value
        this.node = node
    }
}

var snapshotGlobalRoot: ?SnapshotNode = SnapshotNode(1)

func enqueueBlockingFinalizer(): Unit {
    let value = SnapshotBlockingFinalizer()
    blackBox(value.node.id)
}

func dumpTo(path: String, compilerCall: Bool): Bool {
    var result = false
    try (file = File(Path(path), ReadWrite)) {
        let fd = Int32(file.fileDescriptor.fileHandle)
        if (compilerCall) {
            result = unsafe { CJ_MCC_DumpCJHeapData(fd) }
        } else {
            unsafe { CJ_MRT_DumpHeapSnapshot(fd) }
            result = true
        }
    }
    return result
}

main(): Int64 {
    let head = SnapshotNode(2, snapshotGlobalRoot)
    snapshotGlobalRoot = head
    let bools = Array<Bool>(32, repeat: true)
    let shorts = Array<Int16>(64, repeat: 16)
    let ints = Array<Int32>(64, repeat: 32)
    let longs = Array<Int64>(64, repeat: 64)
    let objects = Array<SnapshotNode>(128, {index => SnapshotNode(Int64(index + 100), head)})
    let records = Array<SnapshotRecord>(128, {index => SnapshotRecord(Int32(index), objects[index])})
    let largeShorts = Array<Int16>(40000, repeat: 7)
    let largeInts = Array<Int32>(20000, repeat: 11)
    let largeObjects = Array<SnapshotNode>(10000, {index => objects[index % objects.size]})
    let largeRecords = Array<SnapshotRecord>(10000,
        {index => SnapshotRecord(Int32(index), objects[index % objects.size])})

    let pinned = Array<Int32>(256, repeat: 99)
    let pinnedHandle = unsafe { acquireArrayRawData(pinned) }

    enqueueBlockingFinalizer()
    for (_ in 0..100) {
        gc(heavy: true)
        if (snapshotFinalizerStarted.load() == 1) {
            break
        }
        sleep(Duration.millisecond)
    }

    if (unsafe { CJ_MCC_DumpCJHeapData(-1) }) {
        unsafe { releaseArrayRawData(pinnedHandle) }
        return 1
    }
    if (!dumpTo("./runtime_heap_compiler.dat", true)) {
        unsafe { releaseArrayRawData(pinnedHandle) }
        return 2
    }
    if (!dumpTo("./runtime_heap_api.dat", false)) {
        unsafe { releaseArrayRawData(pinnedHandle) }
        return 3
    }
    unsafe { releaseArrayRawData(pinnedHandle) }

    blackBox(bools[0])
    blackBox(shorts[0])
    blackBox(ints[0])
    blackBox(longs[0])
    blackBox(records[0].value)
    blackBox(largeShorts[0])
    blackBox(largeInts[0])
    blackBox(largeObjects[0].id)
    blackBox(largeRecords[0].value)
    blackBox(pinned[0])
    remove("./runtime_heap_compiler.dat")
    remove("./runtime_heap_api.dat")
    println("runtime heap snapshot coverage pass")
    return 0
}
