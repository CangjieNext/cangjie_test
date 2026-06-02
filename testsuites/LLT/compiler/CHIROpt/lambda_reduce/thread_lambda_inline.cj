// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %enableFuncInlining %debugCHIROpt %cmp_opt %n.cj -o %output | compare %f
// RUN-EXEC-PIPE-0: %run %output
// (LLVM) ASSERT: scan-not The Apply node in the line:25 and the column:14, was optimized by functionInlineForLambd

import std.collection.concurrent.*
import std.random.*

let tasks = 10

func perThreadCode(tasks: Int64, myMap: ConcurrentHashMap<UInt64, Int64>) {
    let random = Random()
    for (j in 0..tasks) {
        myMap.put(random.nextUInt64(), j)
    }
}

func writeTest(): Unit {
    let myMap = ConcurrentHashMap<UInt64, Int64>(concurrencyLevel: 8)
    var fs = Array<Future<Unit>>(2) {
        _ => spawn {perThreadCode(tasks, myMap)}
    }
    for (i in 0..2) {
        fs[i].get()
    }
}

main() {
    writeTest()
}
