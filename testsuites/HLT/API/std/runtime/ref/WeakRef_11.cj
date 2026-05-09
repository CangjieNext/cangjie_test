/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.ref.*

class Date {
    var number: Int64 = 0
    let n: Int64 = 1
}

// Use global strong refs to make lifetime of referents predictable.
var d = Date()
var e = Date()

main() {
    e.number = 5
    var cache = WeakRef<Date>(d, CleanupPolicy.EAGER)
    var b = match (cache.value) {
        case Some(x) => x
        case None => e
    }
    var f = match (b.number) {
        case 0 => 0
        case 5 => 1
        case _ => 1
    }
    var g = 1
    b.number = 10
    if ((b.number == 10) && (d.number == 10) && (e.number == 5)) {
        g = 0
    }
    var h = 1
    d.number = 20
    if ((b.number == 20) && (d.number == 20) && (e.number == 5)) {
        h = 0
    }
    if ((f == 0) && (g == 0) && (h == 0)) {
        return 0
    } else {
        return 1
    }
}
