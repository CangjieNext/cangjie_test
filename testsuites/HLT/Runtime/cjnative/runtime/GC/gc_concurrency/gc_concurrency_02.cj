/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan-not error

import std.sync.*
import std.time.*
import std.runtime.*

main() {
    for (_ in 0..20) {
        spawn {
            f()
        }
    }

    sleep(Duration.second * 10)
}

func f() {
    while (true) {
        let t1 = TimeZone("1", Duration.second * 3600)
        let t2 = t1
        let t3 = TimeZone("2", Duration.second * 3600)
        let atr1 = AtomicReference<TimeZone>(t1)
        let atr2 = AtomicReference<TimeZone>(t3)
        for (_ in 0..100000) {
            TimeZone("1", Duration.second * 3600)
        }
        atr2.store(t2)
        GC()
        if (!(atr1.load() == atr2.load())) {
            println("error")
        }
    }
}
