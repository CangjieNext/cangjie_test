/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
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
import std.time.*

var server = unsafe { zeroValue<Server>() }
var count: AtomicInt64 = AtomicInt64(0)
let serverInit = AtomicInt64(0)
var port: UInt16 = 0

func serve() {
    server = ServerBuilder().addr("127.0.0.1").port(port).build()
    server.distributor.register("/", {
        _ => ()
    })
    spawn {
        server.serve()
    }
    while (server.port == 0) {
        sleep(Duration.millisecond)
    }
}

func client() {
    let client = ClientBuilder().build()

    var req = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/hello").header("Connection", "close").build()
    var res = client.send(req)

    if (res.headers.getFirst("Connection") == "close") {
        count.fetchAdd(1)
    }
}

func asan() {
    server.close()
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        sleep(Duration.millisecond * 100)
        GC()
        sleep(Duration.millisecond * 100)
    }
}

main(): Int64 {
    serve()

    client()

    asan()

    if (count.load() == 1) {
        return 0
    } else {
        return 1
    }
}
