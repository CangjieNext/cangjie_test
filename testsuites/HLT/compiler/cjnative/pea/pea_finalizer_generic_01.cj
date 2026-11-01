/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*

var generic_finalizer_count = 0

class GenericRealFinalizer<T> {
    var n: Int64
    var marker: T
    init(n: Int64, marker: T) {
        this.n = n
        this.marker = marker
    }
    func add(x: Int64): Unit {
        n = ((n * 3) ^ x) & 0xFF
    }
    func get(): Int64 {
        n
    }
    ~init() {
        generic_finalizer_count++
    }
}

func waitForFinalizers(target: Int64): Bool {
    var retries = 0
    while (generic_finalizer_count < target && retries < 60) {
        gc()
        sleep(Duration.millisecond * 50)
        retries++
    }
    return generic_finalizer_count == target
}

main() {
    let N = 100
    generic_finalizer_count = 0
    var x = 0
    for (i in 0..N) {
        var f = GenericRealFinalizer<Int64>(x, i)
        f.add(i)
        x = f.get()
    }
    if (!waitForFinalizers(N)) {
        return 1
    }
    if (x != 64) {
        return 2
    }

    generic_finalizer_count = 0
    var y = 0
    for (i in 0..N) {
        var f = GenericRealFinalizer<Bool>(y, (i % 2 == 0))
        f.add(i)
        y = f.get()
    }
    if (!waitForFinalizers(N)) {
        return 3
    }
    if (y != 64) {
        return 4
    }
    return 0
}
