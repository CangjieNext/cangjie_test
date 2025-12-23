/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC: %run %run_opt %output

import std.sync.*
import std.time.*
import std.convert.*

var reps = 1300000

class A {
    var num: Int32 = 0

    init(num: Int32) {
        this.num = num
    }
}

func benchmarkAtomicStoreReference(): Unit {
    let test = AtomicReference<A>(A(1))

    var startTime = DateTime.now()
    for (i in 0..reps) {
        test.store(A(2))
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)

    println("BenchmarkAtomicStoreReference: " + perTime.format(".2") + " ns/op")
}

main(): Int64 {
    benchmarkAtomicStoreReference()
    return 0
}
