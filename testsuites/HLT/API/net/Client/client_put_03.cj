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
import std.process.*

main(): Int64 {
    let server = serve()
    let client = ClientBuilder().build()
    var b = ByteBuffer()
    b.write("abc".toArray())
    var a = client.put("http://127.0.0.1:${server.port}/ss", "abc".toArray())
    var str = a.toString()
    if (a.status != 200) {
        return 1
    }
    if (str.contains("HTTP/1.1 200 OK") != true) {
        return 2
    }
    if (str.contains("content-length: 5") != true) {
        return 3
    }
    let buf = Array<UInt8>(1024, repeat: 0)
    let len = a.body.read(buf)
    if (!String.fromUtf8(buf).contains("Hello")) {
        println(String.fromUtf8(buf))
        return 5
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
    server.distributor.register("/ss", {
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
