/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../test.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output test.cj
// RUN-EXEC: %run_stdx %output %run_args

import std.io.*
import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import std.net.*
import stdx.encoding.url.*
import std.runtime.*
import std.argopt.*

main(): Int64 {
    let server = serve()
    let client = ClientBuilder().build()
    var a = client.get("http://127.0.0.1:${server.port}/d%E4%BD%A0")
    var str = a.toString()
    println(str)
    if (a.status != 404) {
        return 1
    }
    if (str.contains("HTTP/1.1 404 Not Found") != true) {
        return 2
    }
    if (str.contains("content-length: 13") != true) {
        return 3
    }
    let buf = Array<UInt8>(1024, repeat: 0)
    let len = a.body.read(buf)
    if (!String.fromUtf8(buf).contains("404 Not Found")) {
        return 4
    }

    return 0
}

func serve() {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let server = ServerBuilder().listener(serverSocket).build()
    server
        .distributor
        .register("/d%E4%BD%A0",
            {
                ctx => ctx
                    .responseBuilder
                    .body("Hello")
                    .status(303)
                    .header("Location", "http://127.0.0.1:${server.port}/red")
            })
    server.distributor.register("/", {
        ctx => ctx.responseBuilder.body("Hello from /red")
    })
    spawn {
        server.serve()
    }
    while (server.port == 0) {
        sleep(Duration.millisecond)
    }
    return server
}
