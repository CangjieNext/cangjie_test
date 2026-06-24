/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*
import std.concurrent.*
import std.sync.*

main(): Int64 {
    let launcherCount = 16
    let launchesPerLauncher = 10
    let cancelCount = 1000
    let cmeObserved = AtomicBool(false)

    try {
        threadScope<Unit, Unit> {
            group =>
                for (_ in 0..launcherCount) {
                    group.launch {
                        for (_ in 0..launchesPerLauncher) {
                            try {
                                group.launch { () }
                            } catch (_: ConcurrentModificationException) {
                                cmeObserved.store(true)
                            } catch (_: Exception) {}
                        }
                    }
                }

                for (_ in 0..cancelCount) {
                    try {
                        group.cancelAll()
                    } catch (_: ConcurrentModificationException) {
                        cmeObserved.store(true)
                    } catch (_: Exception) {}
                }
        }
    } catch (_: ConcurrentModificationException) {
        cmeObserved.store(true)
    } catch (_: Exception) {}

    return if (cmeObserved.load()) { 1 } else { 0 }
}
