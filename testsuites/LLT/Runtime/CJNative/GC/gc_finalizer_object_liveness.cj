// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A finalizer object must stay alive while its methods are still being
// called from a loop. If the optimizer lifts the loop-invariant read of
// the object's field out of the loop, GC liveness reports the object dead,
// the GC collects it mid-loop and runs its ~init(), which mutates the field
// a later iteration still reads. This test pins that behavior under -O2.
//
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*

class M {
    var s: ?String = "x"

    func g(): Int64 {
        // If T is finalized mid-loop, s becomes None and this throws.
        s.getOrThrow()
        return 1
    }
}

class T {
    var m = M()

    ~init() {
        m.s = None
    }

    func f(): Int64 {
        return m.g()
    }
}

main(): Int64 {
    let t = T()
    var checksum: Int64 = 0
    for (i in 0..200000) {
        checksum += t.f()
        if (i % 10000 == 0) {
            gc()
        }
    }
    println("finalizer object liveness ok ${checksum}")
    return 0
}
