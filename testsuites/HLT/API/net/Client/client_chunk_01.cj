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

import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import std.io.*
import std.net.*
import std.runtime.*
import std.argopt.*

main(): Int64 {
    let serve = serve()
    let client = ClientBuilder().build()
    var req = HttpRequestBuilder()
        .method("PUT")
        .url("http://127.0.0.1:${serve.port}/s")
        .body("foo=bar&foo=bar2&bar=baz")
        .header("Transfer-Encoding", "chunked")
        .build()
    var a = client.send(req)
    var str = a.toString()
    println(str)
    if (a.status != 200) {
        return 1
    }
    if (str.contains("HTTP/1.1 200 OK") != true) {
        return 2
    }
    if (str.contains("content-length: 5") != true) {
        return 3
    }
    if (str.contains("body size: 5") != true) {
        return 4
    }

    return 0
}

func serve() {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let server = ServerBuilder().listener(serverSocket).build()
    server
        .distributor
        .register("/s", {
            ctx => ctx.responseBuilder.header("a", "a").body("hello").trailer("name", "value")
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
