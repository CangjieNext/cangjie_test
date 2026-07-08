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

class MultiReturnFinalizer {
    var tag: Int64
    init(tag: Int64) {
        this.tag = tag
    }
    ~init() {
        finalizer_count++
    }
}

func pick(branch: Int64): Int64 {
    var f = MultiReturnFinalizer(branch)
    if (branch == 0) {
        return f.tag
    } else if (branch == 1) {
        return f.tag + 1
    } else {
        return f.tag + 2
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
    var acc = 0
    for (i in 0..N) {
        acc += pick(i % 3)
    }
    if (!waitForFinalizers(N)) {
        return 1
    }
    if (acc != 198) {
        return 2
    }
    return 0
}
