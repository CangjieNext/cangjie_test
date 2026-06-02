/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %stdx-package -o %n.%suffix %f
// EXEC-PIPE: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan OK

internal import std.sync.*
internal import std.time.*
internal import std.runtime.*

var cnt = 0

main(): Int64 {
    var timer = Timer.once(Duration.millisecond * 100) {=> cnt += 1}
    timer.cancel()
    sleep(Duration.millisecond * 200)
    if (cnt != 0) {
        return 1
    }
    print("OK")
    GC()
    return 0
}
