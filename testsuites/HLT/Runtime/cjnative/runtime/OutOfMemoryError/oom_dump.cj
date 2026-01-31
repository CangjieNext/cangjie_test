/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (not OHOS and not iOS and not Android) EXEC: %compiler %cmp_opt %f -o %output
// (not OHOS and not iOS and not Android) RUN-EXEC: %export cjHeapSize=4mb && %export cjHeapDumpOnOOM=on && %run %run_opt %output %run_args 2>&1 | compare %f

// ASSERT: scan-1 Heap dump log is writing into

import std.time.*
import std.collection.*

main() {
    for (i in 0..100) {
        spawn {
            =>
                var arr = ArrayList<Int64>(100)
                while (true) {
                    var a = 1
                    arr.add(a)
                }
        }
    }
    sleep(Duration.second * 2)
}
