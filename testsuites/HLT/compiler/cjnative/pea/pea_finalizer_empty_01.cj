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

var empty_finalizer_call_count = 0

class EmptyFinalizer {
    var n: Int64
    init(n: Int64) {
        this.n = n
    }
    func add(x: Int64): Unit {
        n = ((n * 3) ^ x) & 0xFF
    }
    func get(): Int64 {
        n
    }
    ~init() {
    }
}

class EmptyFinalizerProbe {
    var n: Int64
    init(n: Int64) {
        this.n = n
    }
    ~init() {
        empty_finalizer_call_count++
    }
}

func waitForFinalizers(target: Int64): Bool {
    var retries = 0
    while (empty_finalizer_call_count < target && retries < 60) {
        gc()
        sleep(Duration.millisecond * 50)
        retries++
    }
    return empty_finalizer_call_count == target
}

main() {
    let N = 100
    var x = 0
    for (i in 0..N) {
        var f = EmptyFinalizer(x)
        f.add(i)
        x = f.get()
    }
    if (x != 64) {
        return 1
    }

    for (i in 0..N) {
        EmptyFinalizerProbe(i)
    }
    if (!waitForFinalizers(N)) {
        return 2
    }
    return 0
}
