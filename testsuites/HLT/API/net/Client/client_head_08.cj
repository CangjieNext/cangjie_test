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
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import std.net.*
import stdx.encoding.url.*
import std.runtime.*
import std.argopt.*

main(): Int64 {
    let server = serve()
    let client = ClientBuilder().build()
    var a = client.head("http://127.0.0.1:${server.port}/dd")
    var byteStream = ByteBuffer()
    var str = a.toString()
    println(str)
    if (a.status != 200) {
        return 1
    }
    if (str.contains("HTTP/1.1 200 OK") != true) {
        return 2
    }
    if (str.contains("connection: keep-alive") != true) {
        return 4
    }
    if (str.contains("date:") != true) {
        return 5
    }
    if (!test(str)) {
        return 10
    }
    if (str.contains("GMT") != true) {
        return 6
    }

    return 0
}

func serve() {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let server = ServerBuilder().listener(serverSocket).build()
    server.distributor.register("/dd", {
        ctx => ctx.responseBuilder.body("Hello")
    })
    spawn {
        server.serve()
    }
    while (server.port == 0) {
        sleep(Duration.millisecond)
    }
    return server
}
