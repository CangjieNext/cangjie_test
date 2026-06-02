// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not CJNATIVE)EXEC:%interpreter %n.cj 2>&1 | compare %f
// (not not CJNATIVE)EXEC: %compiler %cmp_opt %n.cj -o %output
// (not not CJNATIVE)EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 10
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
class C0 {
    var t0: Int64 = 0
    init() {}
}

class C1 {
    var t1: C0 = C0()
    init() {}
}

class C2 {
    var t2: C1 = C1()
    init() {}
}

main(): Unit {
    let c2 = C2()
    c2.t2.t1.t0 += 10
    println(c2.t2.t1.t0.toString())
}