// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %n.cj -o %output
// EXEC-PIPE-0: %run %output 2>&1 | compare %f
// ASSERT: scan 13344
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class C {
    var t0: Int64
    let t1: Int64 = 3

    init(t0_: Int64) {
        t0 = t0_
    }
}

struct R {
    var t0: Int64
    let t1: C

    init(t0_: Int64, t1_: C) {
        t0 = t0_
        t1 = t1_
    }
}

main(): Int64 {
    var c0 = C(1)
    var r0 = R(2, c0)
    print(r0.t1.t0.toString())
    r0.t1.t0 = 3
    print(r0.t1.t0.toString())
    print(c0.t0.toString())
    c0.t0 = 4
    print(r0.t1.t0.toString())
    print(c0.t0.toString())
    0
}
