/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE) EXEC: %run %run_opt %output %run_args

internal import std.runtime.*

main() {
    var a: Int64 = MemoryInfo.maxHeapSize
    var b: Int64 = MemoryInfo.allocatedHeapSize
    var c: Int64 = MemoryInfo.heapPhysicalMemory
    var UsedHeapSize = getUsedHeapSize()
    return 0
}
