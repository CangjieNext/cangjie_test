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
// ASSERT: scan OK_1
// ASSERT: scan OK_2
// ASSERT: scan OK_3

/*
 * Test description: Test the funcs in class Timer
 * Test API:
 *          public static func once(delay: Duration, task: () -> Unit)
 *          public operator func ==(rhs: Timer): Bool
 *          public operator func !=(rhs: Timer): Bool
 */

internal import std.sync.*
internal import std.time.*
internal import asan.*

var flag = false

main(): Int64 {
    let timer1 = Timer.once(Duration.millisecond * 10) {=> flag = true}
    let timer2 = timer1
    if (timer1 != timer2) {
        return 1
    }
    if (timer1 == timer2) {
        println("OK_1")
    }
    timer1.cancel()
    if (timer1 != timer2) {
        return 1
    }
    if (timer1 == timer2) {
        println("OK_2")
    }
    timer2.cancel()
    if (timer1 != timer2) {
        return 1
    }
    if (timer1 == timer2) {
        println("OK_3")
    }
    asanGC()
    0
}
