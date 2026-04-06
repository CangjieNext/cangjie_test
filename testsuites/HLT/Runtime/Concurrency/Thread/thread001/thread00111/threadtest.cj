/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args


import std.sync.*

let core = 16
var sum: AtomicInt64 = AtomicInt64(0)

func add(): Unit {
    sum.fetchAdd(1)
    while (sum.load() < core) {
        sleep(Duration.nanosecond * -9223372036854775808)
    }
}

main(): Int64 {
    var fut: Future<Unit> = spawn {}
    for (i in 0..core) {
        fut = spawn {add()}
    }
    fut.get()
    print("sum = ${sum.load()}")
    if (sum.load() != core) {
        return 1
    }
    return 0
}
