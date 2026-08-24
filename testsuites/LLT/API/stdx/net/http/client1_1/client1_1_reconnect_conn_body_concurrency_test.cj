/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test Client1_1 prevents concurrent access to HttpBufferedBody when
 *      readResponse fails while body send thread is still active.
 *
 *      Scenario: Server with short httpKeepAliveTimeout (1s). Client sends first
 *      request (HEAD, no body) and waits for the server to close the connection.
 *      Then sends a second request with a slow InputStream body (wrapped as
 *      HttpBufferedBody by the client). The client reuses the stale connection,
 *      readResponse fails with SocketException, and the engine retries (GET is
 *      idempotent). Without the fix, fut.get() was outside the try-finally block,
 *      so the body send thread could still be reading HttpBufferedBody.data
 *      (ArrayList, not thread-safe) when the retry creates a new body send thread
 *      accessing the same HttpBufferedBody, causing concurrent access.
 *      The fix moves fut.get() into the finally block, ensuring the body send
 *      thread completes before sendRequestTimeout returns (even on exception).
 *
 * Test API:
 *      public func send(req: HttpRequest): HttpResponse
 *      ConnNode.sendRequestTimeout with try-finally protection
 */
package tests.client1_1

import stdx.net.http.*
import std.io.*
import std.collection.*

let BODY_DATA = "hello world".toArray()

@Test
class TestClient1_1ReconnectConnBodyConcurrency {
    @TestCase
    func client11KeepAliveTimeoutWithConcurrentBodyAccess(): Unit {
        // Create server with 1s keep-alive timeout
        let (port, server) = startServer()

        let client = getClient()
        sendOnce(client, port)
        
        // keep-alive timeout
        sleep(Duration.second)

        sendOnce(client, port)

        client.close()
        server.close()
    }
}

func startServer(): (UInt16, Server) {
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .httpKeepAliveTimeout(Duration.millisecond * 100)
        .build()

    server.distributor.register("/", handle)

    spawn {server.serve()}
    sleep(Duration.millisecond * 100)
    return (server.port, server)
}

func getClient(): Client {
    let client = ClientBuilder().build()
    return client
}

func sendOnce(client: Client, port: UInt16): Unit {
    let req = HttpRequestBuilder()
        .url("http://127.0.0.1:${port}/")
        .method("GET")
        .header("content-length", "${BODY_DATA.size}")
        .body(SlowBody())
        .build()
    let rsp = client.send(req)
    @Expect(rsp.status, 200)
}

public func handle(ctx: HttpContext): Unit {
    let body = ArrayList<Byte>()
    let buf = Array<Byte>(1024, repeat: 0)
    var len = ctx.request.body.read(buf)
    while (len > 0) {
        body.add(all: buf[0..len])
        len = ctx.request.body.read(buf)
    }
    @Expect(String.fromUtf8(body.toArray()), "hello world")
}

class SlowBody <: InputStream {
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
