/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %run_args 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output 
// ASSERT: scan struct 'MemoryInfo' is deprecated. All static Properties are converted to public functions.

import std.runtime.*

main() {
    println("maxHeapSize is ${MemoryInfo.maxHeapSize}")
    println("${MemoryInfo.allocatedHeapSize}")
    println("${MemoryInfo.heapPhysicalMemory}")
}
