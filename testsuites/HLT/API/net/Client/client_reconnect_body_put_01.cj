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
 *      Test Client1_1 reconnect retry with PUT method and a request body.
 *      PUT is an idempotent method, so the engine retries the request when
 *      the pooled connection is stale. This is the most typical
 *      "idempotent method + body" real-world scenario.
 *
 * Scenario:
 *      1. Server has a short httpKeepAliveTimeout (100ms).
 *      2. First PUT request (with content-length body) establishes connection.
 *      3. Wait > keep-alive timeout so the server closes the connection.
 *      4. Second PUT request reuses the stale connection; readResponse fails
 *         and the engine retries (PUT is idempotent). The body-send coroutine
 *         is delayed by 1s, widening the concurrency window for
 *         HttpBufferedBody access.
 *      5. Server verifies the received body matches expected content.
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

let BODY_DATA = "hello put body data".toArray()

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
        .method("PUT")
        .header("content-length", "${BODY_DATA.size}")
        .body(SlowPutBody())
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

class SlowPutBody <: InputStream {
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
