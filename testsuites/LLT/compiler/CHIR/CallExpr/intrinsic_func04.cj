// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

import std.runtime.*

func invoke<T>(f: (T) -> T, v: T): T {
    f(v)
}

main(): Int64 {
    var p = CPointer<Int64>()
    let r = invoke<CPointer<Int64>>(blackBox<CPointer<Int64>>, p)
    if (!r.isNull()) {
        return 1
    }
    0
}
