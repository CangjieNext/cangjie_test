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
// RUN-EXEC-PIPE-1: %run_stdx %output %run_args 2>&1 | compare %f
// ASSERT: scan HttpException: Redirect loop exceed 10 times.

import std.io.*
import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import std.net.*
import std.runtime.*
import std.argopt.*

main(): Int64 {
    let server = serve()
    let client = ClientBuilder().build()
    var a = client.get("http://127.0.0.1:${server.port}/dd")

    return 0
}

func serve() {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let server = ServerBuilder().listener(serverSocket).build()
    server
        .distributor
        .register("/dd",
            {
                ctx => ctx
                    .responseBuilder
                    .body("Hello")
                    .header("Location", "http://127.0.0.1:${server.port}/red")
                    .status(301)
            })
    server
        .distributor
        .register("/red",
            {
                ctx => ctx
                    .responseBuilder
                    .body("Hello from /red")
                    .header("Location", "http://127.0.0.1:${server.port}/red")
                    .status(301)
            })
    spawn {
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        return server
    }
    while (server.port == 0) {
        sleep(Duration.millisecond)
    }
    return server
}
