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
 *      Test Client1_1 reconnect retry stability across multiple
 *      consecutive retry cycles. Each cycle consists of a normal request
 *      followed by a keep-alive timeout, then a request that reuses the
 *      stale connection and triggers retry.
 *
 *      This verifies that the fix (fut.get() in the finally block) keeps
 *      the HttpBufferedBody state stable not just for one retry, but
 *      across many retry cycles without degradation.
 *
 * Scenario:
 *      Repeat 3 times:
 *      1. Send a GET request with a slow InputStream body (wrapped as
 *         HttpBufferedBody by the client).
 *      2. Wait for the server's short httpKeepAliveTimeout (100ms) so the
 *         idle connection is closed by the server.
 *      3. The next send reuses the stale connection, readResponse fails,
 *         and the engine retries. Each request gets its own fresh
 *         SlowMultiBody instance so there is no state carry-over.
 *      4. Server verifies the received body each time.
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

let BODY_DATA = "hello multi retry".toArray()
let RETRY_COUNT = 3

main(): Int64 {
    let server = serve()
    let client = ClientBuilder().build()

    for (i in 0..RETRY_COUNT) {
        let ret = sendOnce(client, server.port)
        if (ret != 0) {
            println("request ${i} failed with code ${ret}")
            client.close()
            server.close()
            return i + 1
        }
        // Wait for keep-alive timeout - connection becomes stale
        sleep(Duration.second)
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
        let received = String.fromUtf8(body.toArray())
        var msg = "fail"
        if (received == String.fromUtf8(BODY_DATA)) {
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
        .header("content-length", "${BODY_DATA.size}")
        .body(SlowMultiBody())
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

class SlowMultiBody <: InputStream {
    var times = 0
    public func read(buf: Array<Byte>): Int64 {
        if (times == 0) {
            times++
            BODY_DATA.copyTo(buf, 0, 0, BODY_DATA.size)
            sleep(Duration.second)
            return BODY_DATA.size
        }
        return 0
    }
}
