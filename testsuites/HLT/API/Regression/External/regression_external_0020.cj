/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./../../asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f asan.%middle -o %output
// RUN-EXEC: %run_stdx %output %run_args

import std.io.*
import stdx.net.http.*
import stdx.net.tls.*
import std.net.*
import stdx.encoding.url.*
import asan.*

var port: UInt16 = 0
var ser = Option<Server>.None
var formInformation: String = "b"

main(): Int64 {
    spawn {
        serve()
    }
    sleep(Duration.second)
    port = ser.getOrThrow().port
    let client = ClientBuilder().build()
    client.get("http://127.0.0.1:${port}/foo?a=a")
    if (formInformation != "a") {
        return 1
    }
    ser.getOrThrow().close()
    ser = None
    asanGC()
    return 0
}

func serve() {
    let server = ServerBuilder().addr("0.0.0.0").port(0).build()
    server.distributor.register("/foo", {
        ctx => formInformation = ctx.request.form.get("a") ?? ""
    })
    ser = Option<Server>.Some(server)
    server.serve()
}
