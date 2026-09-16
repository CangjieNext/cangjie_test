/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../test.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output test.cj
// RUN-EXEC: %run_stdx %output %run_args

/*
 * Test description:
 *      Test Client1_1 reconnect retry with a large body that requires
 *      multiple read() calls on HttpBufferedBody.
 *
 *      Each HttpBufferedBody.read() call appends data to an internal
 *      ArrayList<Byte> (not thread-safe). With a large body the
 *      ArrayList is appended to multiple times, which makes concurrent
 *      corruption more likely when two body-send coroutines race during
 *      retry (the old coroutine still adding data while the retry's new
 *      coroutine reads the cached bytes). This test reliably exercises
 *      that scenario.
 *
 * Scenario:
 *      1. Server has a short httpKeepAliveTimeout (100ms).
 *      2. First request (GET, content-length=5000) establishes connection.
 *      3. Wait > keep-alive timeout so the server closes the connection.
 *      4. Second request reuses the stale connection; readResponse fails
 *         and the engine retries. The body-send coroutine's first read()
 *         is delayed by 1s, widening the concurrency window.
 *      5. Server verifies the full 5000-byte body is received intact.
 */

import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import std.io.*
import std.net.*
import std.runtime.*
import std.argopt.*
import std.collection.*
import std.process.*

let BODY_SIZE = 5000

main(): Int64 {
    let server = serve()
    let client = ClientBuilder().build()

    // First request - establishes pooled connection
    let ret1 = sendOnce(client, server.port)
    if (ret1 != 0) {
        client.close()
        server.close()
        return 1
    }

    // Wait for keep-alive timeout - connection becomes stale
    sleep(Duration.second)

    // Second request - reuses stale connection, triggers retry
    let ret2 = sendOnce(client, server.port)
    if (ret2 != 0) {
        client.close()
        server.close()
        return 2
    }

    client.close()
    server.close()

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
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .httpKeepAliveTimeout(Duration.millisecond * 100)
        .build()

    server.distributor.register("/", { ctx =>
        let body = ArrayList<Byte>()
        let buf = Array<Byte>(1024, repeat: 0)
        var len = ctx.request.body.read(buf)
        while (len > 0) {
            body.add(all: buf[0..len])
            len = ctx.request.body.read(buf)
        }
        let arr = body.toArray()
        var msg = "fail"
        if (arr.size == BODY_SIZE) {
            msg = "ok"
        }
        ctx.responseBuilder.status(200).body(msg)
    })

    spawn { server.serve() }
    while (server.port == 0) {
        sleep(Duration.millisecond)
    }
    return server
}

func sendOnce(client: Client, port: UInt16): Int64 {
    let req = HttpRequestBuilder()
        .url("http://127.0.0.1:${port}/")
        .method("GET")
        .header("content-length", "${BODY_SIZE}")
        .body(LargeSlowBody())
        .build()
    let rsp = client.send(req)
    if (rsp.status != 200) {
        return 1
    }
    let buf = Array<UInt8>(1024, repeat: 0)
    let len = rsp.body.read(buf)
    if (!String.fromUtf8(buf[0..len]).contains("ok")) {
        return 2
    }
    return 0
}

class LargeSlowBody <: InputStream {
    var pos = 0
    var firstRead = true
    let data: Array<Byte>

    init() {
        data = Array<Byte>(BODY_SIZE) { i => UInt8(i % 256) }
    }

    public func read(buf: Array<Byte>): Int64 {
        if (pos >= BODY_SIZE) {
            return 0
        }
        if (firstRead) {
            firstRead = false
            sleep(Duration.second)
        }
        var len = buf.size
        if (pos + len > BODY_SIZE) {
            len = BODY_SIZE - pos
        }
        buf[0..len] = data[pos..pos + len]
        pos += len
        return len
    }
}
