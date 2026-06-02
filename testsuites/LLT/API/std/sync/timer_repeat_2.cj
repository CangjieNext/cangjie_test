/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./../../asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC-PIPE-0: %compiler %cmp_opt %f asan.%middle -o %output
// EXEC-PIPE: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan OK

internal import std.sync.*
internal import std.time.*
internal import asan.*

var counter = 0

main(): Int64 {
    var ticker = Timer.repeat(Duration.millisecond * 100, Duration.millisecond * 100, {=> counter += 1})
    sleep(Duration.second)
    if (counter < 8 || counter > 10) {
        print("counter = ${counter}")
        return 1
    }
    print("OK")
    asanGC()
    return 0
}
