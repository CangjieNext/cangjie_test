/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run_stdx %output %run_args | compare %f
// ASSERT: scan case pass

import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import std.io.*
import std.net.*
import std.runtime.*
import std.argopt.*

main(): Int64 {
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
    server.close()
    sleep(Duration.second)
    try {
        server.serve()
        ()
    } catch (e: Exception) {
        print("case pass")
    }
    return 0
}
