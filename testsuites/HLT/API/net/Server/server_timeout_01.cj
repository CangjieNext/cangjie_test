/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: file.txt
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_args compare %f | compare %f
// ASSERT: scan-not Native function error

import std.io.*
import std.fs.*
import std.net.*
import stdx.net.http.*
import stdx.crypto.kit.*
import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.sync.*
import std.runtime.*
import std.argopt.*
import std.time.*

var ser = Option<Server>.None
var port: UInt16 = 0
var count: AtomicInt64 = AtomicInt64(0)

main(): Int64 {
    spawn {
        try {
            serve()
        } catch (e: Exception) {
            println(e.message)
        }
    }
    sleep(Duration.second)
    let client = ClientBuilder().build()
    var req = HttpRequestBuilder().method("GET").url("http://127.0.0.1:${port}/page1").build()
    var a = client.send(req)
    var str = a.toString()

    return 0
}

func serve() {
    let serverSocket = TcpServerSocket(bindAt: port)
    let server = ServerBuilder().listener(serverSocket).readTimeout(Duration.second * 5).build()
    server
        .distributor
        .register("/page1", {
            ctx => ctx.responseBuilder.body("Hello").header("Transfer-Encoding", "chunked")
        })
}
