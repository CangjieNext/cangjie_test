/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./files
// (not Windows) EXEC: ulimit -n 10000
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  -o %n.%suffix %f
// RUN-EXEC: %export cjHeapSize=16GB && %export JETVMPROP=-Xmx16G && %run_stdx %n.%suffix %run_args

import std.time.*
import std.io.*
import stdx.net.http.*
import stdx.net.tls.*
import std.net.*
import std.sync.*
import std.argopt.*
import std.runtime.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import std.collection.*

let successNum = AtomicInt64(0)
let Num = AtomicInt64(0)

main(): Int64 {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    server.distributor.register("/", {
        httpContext => httpContext.responseBuilder.header("a", "b")
    })
    spawn {
        server.serve()
    }
    while (server.port == 0) {
        sleep(Duration.millisecond)
    }
    let fList = ArrayList<Future<Int64>>()
    for (_ in 0..10) {
        var arr = spawn {
            successNum.fetchAdd(clientOnce(server.port))
        }
        fList.add(arr)
    }
    for (i in fList) {
        i.get()
    }
    if (successNum.load() != 10) {
        throw Exception("successNum should be 10, but get ${successNum.load()}.")
    }
    server.close()
    return 0
}

func clientOnce(port: UInt16): Int64 {
    var client = ClientBuilder().build()
    for (_ in 0..9) {
        var req = HttpRequestBuilder().url("http://127.0.0.1:${port}/").header("Connection", "keep-alive").build()
        client.send(req)
    }
    var req = HttpRequestBuilder().url("http://127.0.0.1:${port}/").header("Connection", "close").build()
    client.send(req)
    client.close()
    return 1
}
