/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./../../asan
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f asan.%middle -o %output
// RUN-EXEC: %run_stdx %output %run_args

import std.io.*
import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import std.net.*
import std.sync.*
import asan.*

var port: AtomicUInt16 = AtomicUInt16(0)
var ser = Option<Server>.None

main(): Int64 {
    let server = serve()
    let client = ClientBuilder().build()
    var ss = ByteBuffer()
    var requestBodyStr = """
abcdefgh
ABCDEFGH
一二三四五
foo=bar&foo=bar2&bar=baz"""
    ss.write(requestBodyStr.toArray())
    var req = HttpRequestBuilder()
        .method("POST")
        .url("http://127.0.0.1:${port.load()}/hello")
        .body(requestBodyStr)
        .build()

    let buf = Array<UInt8>(1024, repeat: 0)
    let len = req.body.read(buf)
    println(String.fromUtf8(buf))

    var body = req.body
    if (!String.fromUtf8(buf).contains(requestBodyStr)) {
        return 1
    }
    asanGC()
    return 0
}

func serve() {
    let serverSocket = TcpServerSocket(bindAt: port.load())
    let server = ServerBuilder().listener(serverSocket).build()
    server.distributor.register("/hello", {
        ctx => ctx.responseBuilder.body("Server.get.1")
    })
    spawn {
        server.serve()
    }
    sleep(Duration.second)
    return server
}
