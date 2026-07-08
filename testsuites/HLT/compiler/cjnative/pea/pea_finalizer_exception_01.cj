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
var finally_marker = 0

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
    ~init() {
        finalizer_count++
    }
}

func maybeThrow(throwIt: Bool, n: Int64): Int64 {
    var f = ScopedFinalizer(n)
    escaped = f
    if (throwIt) {
        throw MyException()
    }
    return f.n
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
    finally_marker = 0
    var caught = 0
    var normal_sum = 0
    for (i in 0..N) {
        try {
            if (i % 2 == 0) {
                maybeThrow(true, i)
            } else {
                normal_sum += maybeThrow(false, i)
            }
        } catch (e: MyException) {
            caught++
        } finally {
            finally_marker++
            escaped = None
        }
    }
    if (!waitForFinalizers(N)) {
        return 1
    }
    if (caught != N / 2) {
        return 2
    }
    if (finally_marker != N) {
        return 3
    }
    if (normal_sum != 2500) {
        return 4
    }
    return 0
}
