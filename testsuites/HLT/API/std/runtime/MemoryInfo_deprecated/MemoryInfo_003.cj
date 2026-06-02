/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

import std.runtime.*

main(): Int64 {
    var a = 0
    var b = 0
    var c = 0
    a = MemoryInfo.maxHeapSize
    b = MemoryInfo.allocatedHeapSize
    c = MemoryInfo.heapPhysicalMemory
    MemoryInfo.maxHeapSize = b
    return 0
}
// ASSERT: scan sema_cannot_assign_to_immutable
