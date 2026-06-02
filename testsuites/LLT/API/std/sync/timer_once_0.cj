/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./../../asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %cmp_opt %f asan.%middle -o %output
// EXEC-PIPE: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan OK

internal import std.sync.*
internal import std.time.*
internal import asan.*

var flag = false

main(): Int64 {
    var timer = Timer.once(Duration.millisecond * 100) {
        => flag = true
    }
    sleep(Duration.millisecond * 300)
    if (!flag) {
        print("flag = ${flag}")
        return 1
    }
    asanGC()
    print("OK")
    return 0
}
