/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: check_stdin_partial_read.py
// EXEC: %compiler %cmp_opt -o %output %f
// (not OHOS and not iOS) RUN-EXEC: %python check_stdin_partial_read.py -- %run %run_opt %output %run_args
// ASSERT: scan PASS

import std.env.getStdIn
import std.env.getVariable

func printRead(bufferSize: Int64): Unit {
    let buffer = Array<Byte>(bufferSize, repeat: 0)
    let count = getStdIn().read(buffer)
    println("${count}:${buffer[..count]}")
}

main() {
    let mode = getVariable("CJ_STDIN_PARTIAL_READ_MODE")
    if (mode == Some("empty")) {
        printRead(0)
    } else if (mode == Some("small")) {
        printRead(4)
        printRead(4)
    } else if (mode == Some("buffered")) {
        println(getStdIn().readUntil(r'a'))
        printRead(4096)
    } else if (mode == Some("mixed")) {
        println(getStdIn().readln())
        printRead(4096)
    } else {
        printRead(4096)
    }
}
