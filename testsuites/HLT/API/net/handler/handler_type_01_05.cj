/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import std.io.*
import std.net.*
import std.runtime.*
import std.argopt.*

var ser = Option<Server>.None
var port: UInt16 = 18061

main(): Int64 {
    let server = serve()
    let client = ClientBuilder().build()
    var a = client.get("http://127.0.0.1:${server.port}/dd")
    if (a.status != 200) {
        return 1
    }
    if (!a.toString().contains("dd: dd")) {
        return 2
    }
    var b = client.get("http://127.0.0.1:${server.port}/red")
    if (b.status != 200) {
        return 3
    }
    if (!b.toString().contains("red: red")) {
        return 4
    }

    return 0
}

func serve() {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let server = ServerBuilder().listener(serverSocket).build()
    server.distributor.register("/dd", {
        ctx => ctx.responseBuilder.header("dd", "dd")
    })
    server.distributor.register("/red", {
        ctx => ctx.responseBuilder.header("red", "red")
    })
    spawn {
        server.serve()
    }
    while (server.port == 0) {
        sleep(Duration.millisecond)
    }
    return server
}
