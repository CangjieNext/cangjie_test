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
// EXEC: %run %run_opt %n.%suffix %run_args

/*
 * Test description: Test func sleep
 * Test API:
 *          public func sleep(dur: Duration): Unit
 */

internal import std.sync.*
internal import std.time.*
internal import asan.*

var flag = false

main(): Int64 {
    sleep(Duration.nanosecond * 1)
    sleep(Duration.microsecond * 1)
    sleep(Duration.millisecond * 1)
    sleep(Duration.second * 1)
    asanGC()
    0
}
