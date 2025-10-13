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
// RUN-EXEC-PIPE: %run_stdx %output %run_args | compare %f
// ASSERT: scan case pass

import std.io.*
import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import std.net.*
import stdx.encoding.url.*
import std.runtime.*
import std.argopt.*
import std.process.*

main(): Int64 {
    let server = serve()
    let client = ClientBuilder().build()
    try {
        client.post("http://127.0.0.1:${server.port}/d\"", "abc".toArray())
        ()
    } catch (e: Exception) {
        print("case pass")
    }
    let ao = ArgOpt(Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        sleep(Duration.second * 2)
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}

func serve() {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let server = ServerBuilder().listener(serverSocket).build()
    server
        .distributor
        .register("/",
            {
                ctx => ctx
                    .responseBuilder
                    .status(303)
                    .body("Hello")
                    .header("Location", "http://127.0.0.1:${server.port}/red")
            })
    server.distributor.register("/red", {
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
