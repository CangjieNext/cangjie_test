/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: test.txt
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.net.http.*
import stdx.net.tls.*
import std.time.*
import std.fs.*
import stdx.log.*
import stdx.logger.*
import std.console.Console

@When[os == "Windows"]
let expect: Array<Byte> = [104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100, 33, 13, 10]
@When[os != "Windows"]
let expect: Array<Byte> = [104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100, 33, 10]

main(): Int64 {
    println("webserver start ...")

    try {
        var content = File.readFrom("test.txt")
        println("hello world1")
        println(content)
        if (content == expect) {
            return 0
        }
    } catch (e: Exception) {
        let errInfo = "runtimeException while open file:"
        println(errInfo)
    }

    return 1
}
