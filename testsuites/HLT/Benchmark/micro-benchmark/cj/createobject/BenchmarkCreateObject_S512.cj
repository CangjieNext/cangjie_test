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
        let i13: Int64, let i14: Int64, let i15: Int64, let i16: Int64,
        let i17: Int64, let i18: Int64, let i19: Int64, let i20: Int64,
        let i21: Int64, let i22: Int64, let i23: Int64, let i24: Int64,
        let i25: Int64, let i26: Int64, let i27: Int64, let i28: Int64,
        let i29: Int64, let i30: Int64, let i31: Int64, let i32: Int64,
        let i33: Int64, let i34: Int64, let i35: Int64, let i36: Int64,
        let i37: Int64, let i38: Int64, let i39: Int64, let i40: Int64,
        let i41: Int64, let i42: Int64, let i43: Int64, let i44: Int64,
        let i45: Int64, let i46: Int64, let i47: Int64, let i48: Int64,
        let i49: Int64, let i50: Int64, let i51: Int64, let i52: Int64,
        let i53: Int64, let i54: Int64, let i55: Int64, let i56: Int64,
        let i57: Int64, let i58: Int64, let i59: Int64, let i60: Int64,
        let i61: Int64, let i62: Int64, let i63: Int64, let i64: Int64
    ) {}
}

let reps = 5000000

main() {
    var big = Array<Big>(reps + 1, repeat: Big(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0))
    let startTime = DateTime.now()
    for (i in 0..reps) {
        big[i] = Big(i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i,
                    i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i)
    }
    let endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkCreateObject_S512: ${perTime.format(".2")} ns/op")
    println(big[10].i1)
}
