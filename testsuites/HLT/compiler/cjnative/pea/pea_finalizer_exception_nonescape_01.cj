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

var finalizer_count = 0

var escaped: ?ScopedFinalizer = None

class MyException <: Exception {
    public init() {
        super("pea finalizer test exception")
    }
}

class ScopedFinalizer {
    var n: Int64
    init(n: Int64) {
        this.n = n
    }
    func conditionalEscape(doEscape: Bool): Unit {
        if (doEscape) {
            escaped = this
        }
    }
    ~init() {
        finalizer_count++
    }
}

func waitForFinalizers(target: Int64): Bool {
    var retries = 0
    while (finalizer_count < target && retries < 60) {
        gc()
        sleep(Duration.millisecond * 50)
        retries++
    }
    return finalizer_count == target
}

main() {
    let N = 100
    finalizer_count = 0
    var caught = 0
    for (i in 0..N) {
        try {
            var f = ScopedFinalizer(i)
            f.conditionalEscape(false)
            if (i % 2 == 0) {
                throw MyException()
            }
        } catch (e: MyException) {
            caught++
        }
    }
    escaped = None
    if (!waitForFinalizers(N)) {
        return 1
    }
    if (caught != N / 2) {
        return 2
    }
    return 0
}
