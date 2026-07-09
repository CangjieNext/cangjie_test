// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

import std.runtime.*

struct S {
    var x: Int64 = 0
}

func invoke<T>(f: (T) -> T, v: T): T {
    f(v)
}

main(): Int64 {
    var s = S()
    s.x = 7
    let r = invoke<S>(blackBox<S>, s)
    if (r.x != 7) {
        return 1
    }
    0
}
