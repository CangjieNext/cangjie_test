/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: check_read_fully.py
// EXEC: %compiler %cmp_opt -o %output %f
// (not OHOS and not iOS) RUN-EXEC: %run %python check_read_fully.py -- %run_opt ./%output %run_args
// ASSERT: scan PASS

import std.env.getStdIn
import std.env.getVariable
import std.io.*

main() {
    let empty = getVariable("CJ_READ_FULLY_MODE") == Some("empty")
    let buffer = Array<Byte>(if (empty) { 0 } else { 8 }, repeat: 0)
    print("READY\n", flush: true)
    try {
        getStdIn().readFully(buffer)
        print("FULL:${buffer}\n", flush: true)
    } catch (e: IOException) {
        print("INCOMPLETE:${buffer}\n", flush: true)
    }
}
