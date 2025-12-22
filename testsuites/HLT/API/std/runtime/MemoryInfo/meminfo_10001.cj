/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC-PIPE: %export cjHeapSize=100mb && %export JETVMPROP=-Xmx100M && %run %run_opt %output %run_args | compare %f
// ASSERT: scan maxHeapSize is 104857600

import std.runtime.*

main() {
    println("maxHeapSize is ${getMaxHeapSize()}")
    println("${getAllocatedHeapSize()}")
    println("${getUsedHeapSize()}")
}
