// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify CJ_MCC_GetAllocatedLocalObjectSize: it is zero without live local
// objects, grows with local objects while their scope is active, ignores heap
// objects, and falls back once the owning scope returns.
// EXEC: %compiler %cmp_opt %disableFuncInlining %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan local object size pass

foreign func CJ_MCC_GetAllocatedLocalObjectSize(): UIntNative

func localObjectBytes(): Int64 {
    return Int64(unsafe { CJ_MCC_GetAllocatedLocalObjectSize() })
}

class LocalValue {
    var value: Int64
    var pad0: Int64 = 0
    var pad1: Int64 = 0

    exclave init(this @local!, value: Int64) {
        this.value = value
    }
}

class HeapValue {
    var value: Int64

    init(value: Int64) {
        this.value = value
    }
}

var failures: Int64 = 0

func check(condition: Bool, label: String): Unit {
    if (!condition) {
        failures += 1
        println("local object size check failed: ${label}")
    }
}

// Live local objects are counted while their scope is active. The scope ends
// when this function returns, reclaiming all of its local objects.
func scopedLocalObjects(): Int64 {
    let scopeStart = localObjectBytes()
    var sum: Int64 = 0
    for (i in 0..100) {
        let value: LocalValue @local! = LocalValue(i) @local!
        sum += value.value
    }
    let scopeEnd = localObjectBytes()
    // 100 objects with three Int64 fields each occupy at least 100 * 24 bytes.
    check(scopeStart == 0, "empty scope reports zero")
    check(scopeEnd - scopeStart >= 100 * 24, "counter grows with local objects")

    // Heap allocations must not be counted as local object bytes.
    let beforeHeap = localObjectBytes()
    let heapValue = HeapValue(7)
    if (heapValue.value != 7) {
        failures += 1
        println("local object size check failed: heap object is broken")
    }
    let afterHeap = localObjectBytes()
    check(afterHeap == beforeHeap, "heap objects are not counted")
    return sum
}

main(): Int64 {
    let baseline = localObjectBytes()
    check(baseline == 0, "baseline is zero")

    let sum = scopedLocalObjects()
    check(sum == 4950, "scope produced expected values")

    // After the scope returns, its local objects are reclaimed.
    let afterScope = localObjectBytes()
    check(afterScope == baseline, "counter falls back after scope end")

    if (failures == 0) {
        println("local object size pass")
        return 0
    }
    return 1
}
