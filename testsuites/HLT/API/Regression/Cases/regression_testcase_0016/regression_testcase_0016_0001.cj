/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import std.io.*
import std.fs.*
import std.net.*
import stdx.net.http.*
import stdx.net.tls.*
import std.sync.*
import std.runtime.*
import std.argopt.*
import std.process

var server = unsafe { zeroValue<Server>() }
var count: AtomicInt64 = AtomicInt64(0)
var port: UInt16 = 0

func serve() {
    server = ServerBuilder().addr("127.0.0.1").port(port).build()
    server
        .distributor
        .register("/",
            {
                httpContext => if (httpContext.request.headers.getFirst("Connection") == Some("close")) {
                    count.fetchAdd(1)
                }
            })
    spawn {
        server.serve()
    }
}

func client(): Unit {
    let client = ClientBuilder().build()

    var req = HttpRequestBuilder()
        .method("POST")
        .url("http://127.0.0.1:${server.port}/")
        .header("Connection", "close")
        .build()

    sleep(Duration.millisecond * 1000)
    try {
        client.send(req)
        client.send(req)
    } catch (e: Exception) {
        count.fetchAdd(1)
    }
}

func asan() {
    server.close()
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        sleep(Duration.second * 1)
        GC()
        sleep(Duration.second * 1)
    }
}

main(): Int64 {
    serve()
    sleep(Duration.second)

    client()
    sleep(Duration.millisecond * 100)

    asan()

    if (count.load() == 2) {
        return 0
    } else {
        return 1
    }
}
