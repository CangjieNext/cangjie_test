// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

interface I<T> {
    mut func f1(x: T): T {
        f2(x)
    }
    mut func f2(x: T): T
}

struct S2 {
    var field = 1
}

extend S2 <: I<Int64> {
    public mut func f2(x: Int64): Int64 {
        field = 3
        0
    }
}

main() {
    var s = S2()
    s.f1(1)
    if (s.field != 3) {
        return 1
    }
    s.field = 0
    try {
        s.f1(1)
    } catch (_) {}
    if (s.field != 3) {
        return 1
    }
    0
}
