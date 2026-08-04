/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args


import std.time.*
import std.convert.*

class Big {
    Big(let i1: Int64, let i2: Int64, let i3: Int64, let i4: Int64,
        let i5: Int64, let i6: Int64, let i7: Int64, let i8: Int64,
        let i9: Int64, let i10: Int64, let i11: Int64, let i12: Int64,
        let i13: Int64, let i14: Int64, let i15: Int64, let i16: Int64
    ) {}
}

let reps = 10000000

main() {
    var big = Array<Big>(reps + 1, repeat: Big(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0))
    let startTime = DateTime.now()
    for (i in 0..reps) {
        big[i] = Big(i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i)
    }
    let endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkCreateObject_S128: ${perTime.format(".2")} ns/op")
    println(big[10].i1)
}
