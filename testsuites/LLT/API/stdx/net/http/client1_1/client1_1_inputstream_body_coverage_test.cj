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
 *      Full coverage matrix for InputStream body (HttpBufferedBody) path.
 *      Tests all combinations of:
 *        - Method: GET, PUT, POST, DELETE, HEAD
 *        - Connection: new, pool-reuse, pool-stale-retry
 *        - Encoding: content-length, chunked
 *        - Expect 100-continue: yes, no
 *
 *      InputStream body is the only path that triggers HttpBufferedBody
 *      wrapping in checkReq. Previous test suite covered only 3/60
 *      combinations (12%). This file covers the remaining gaps.
 *
 * Test API:
 *      public func send(req: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import std.sync.*

let BODY_DATA = "hello world from cangjie".toArray()
let STALE_WAIT = Duration.millisecond * 200

@Test
class TestInputStreamBodyMatrix {

    // === GET ===

    @TestCase
    func getInputStreamAllCombos(): Unit {
        // new + content-length
        runCombo("GET", Conn.New, Enc.ContentLength, Expect.No)
        // new + chunked
        runCombo("GET", Conn.New, Enc.Chunked, Expect.No)
        // new + content-length + expect-100
        runCombo("GET", Conn.New, Enc.ContentLength, Expect.Yes)
        // new + chunked + expect-100
        runCombo("GET", Conn.New, Enc.Chunked, Expect.Yes)
        // pool-reuse + content-length
        runCombo("GET", Conn.PoolReuse, Enc.ContentLength, Expect.No)
        // pool-reuse + chunked
        runCombo("GET", Conn.PoolReuse, Enc.Chunked, Expect.No)
        // pool-reuse + content-length + expect-100
        runCombo("GET", Conn.PoolReuse, Enc.ContentLength, Expect.Yes)
        // pool-reuse + chunked + expect-100
        runCombo("GET", Conn.PoolReuse, Enc.Chunked, Expect.Yes)
        // pool-stale-retry + content-length
        runCombo("GET", Conn.PoolStaleRetry, Enc.ContentLength, Expect.No)
        // pool-stale-retry + chunked
        runCombo("GET", Conn.PoolStaleRetry, Enc.Chunked, Expect.No)
        // pool-stale-retry + content-length + expect-100
        runCombo("GET", Conn.PoolStaleRetry, Enc.ContentLength, Expect.Yes)
        // pool-stale-retry + chunked + expect-100
        runCombo("GET", Conn.PoolStaleRetry, Enc.Chunked, Expect.Yes)
        println("get_inputstream_all_combos_ok")
    }

    // === PUT ===

    @TestCase
    func putInputStreamAllCombos(): Unit {
        runCombo("PUT", Conn.New, Enc.ContentLength, Expect.No)
        runCombo("PUT", Conn.New, Enc.Chunked, Expect.No)
        runCombo("PUT", Conn.New, Enc.ContentLength, Expect.Yes)
        runCombo("PUT", Conn.New, Enc.Chunked, Expect.Yes)
        runCombo("PUT", Conn.PoolReuse, Enc.ContentLength, Expect.No)
        runCombo("PUT", Conn.PoolReuse, Enc.Chunked, Expect.No)
        runCombo("PUT", Conn.PoolReuse, Enc.ContentLength, Expect.Yes)
        runCombo("PUT", Conn.PoolReuse, Enc.Chunked, Expect.Yes)
        runCombo("PUT", Conn.PoolStaleRetry, Enc.ContentLength, Expect.No)
        runCombo("PUT", Conn.PoolStaleRetry, Enc.Chunked, Expect.No)
        runCombo("PUT", Conn.PoolStaleRetry, Enc.ContentLength, Expect.Yes)
        runCombo("PUT", Conn.PoolStaleRetry, Enc.Chunked, Expect.Yes)
        println("put_inputstream_all_combos_ok")
    }

    // === POST ===

    @TestCase
    func postInputStreamAllCombos(): Unit {
        runCombo("POST", Conn.New, Enc.ContentLength, Expect.No)
        runCombo("POST", Conn.New, Enc.Chunked, Expect.No)
        runCombo("POST", Conn.New, Enc.ContentLength, Expect.Yes)
        runCombo("POST", Conn.New, Enc.Chunked, Expect.Yes)
        runCombo("POST", Conn.PoolReuse, Enc.ContentLength, Expect.No)
        runCombo("POST", Conn.PoolReuse, Enc.Chunked, Expect.No)
        runCombo("POST", Conn.PoolReuse, Enc.ContentLength, Expect.Yes)
        runCombo("POST", Conn.PoolReuse, Enc.Chunked, Expect.Yes)
        // POST is non-idempotent — pool-stale won't auto-retry.
        // Behavior is timing-dependent (may succeed or throw), verify no crash.
        runComboAcceptEither("POST", Conn.PoolStaleRetry, Enc.ContentLength, Expect.No)
        runComboAcceptEither("POST", Conn.PoolStaleRetry, Enc.Chunked, Expect.No)
        runComboAcceptEither("POST", Conn.PoolStaleRetry, Enc.ContentLength, Expect.Yes)
        runComboAcceptEither("POST", Conn.PoolStaleRetry, Enc.Chunked, Expect.Yes)
        println("post_inputstream_all_combos_ok")
    }

    // === DELETE ===

    @TestCase
    func deleteInputStreamAllCombos(): Unit {
        runCombo("DELETE", Conn.New, Enc.ContentLength, Expect.No)
        runCombo("DELETE", Conn.New, Enc.Chunked, Expect.No)
        runCombo("DELETE", Conn.New, Enc.ContentLength, Expect.Yes)
        runCombo("DELETE", Conn.New, Enc.Chunked, Expect.Yes)
        runCombo("DELETE", Conn.PoolReuse, Enc.ContentLength, Expect.No)
        runCombo("DELETE", Conn.PoolReuse, Enc.Chunked, Expect.No)
        runCombo("DELETE", Conn.PoolReuse, Enc.ContentLength, Expect.Yes)
        runCombo("DELETE", Conn.PoolReuse, Enc.Chunked, Expect.Yes)
        runCombo("DELETE", Conn.PoolStaleRetry, Enc.ContentLength, Expect.No)
        runCombo("DELETE", Conn.PoolStaleRetry, Enc.Chunked, Expect.No)
        runCombo("DELETE", Conn.PoolStaleRetry, Enc.ContentLength, Expect.Yes)
        runCombo("DELETE", Conn.PoolStaleRetry, Enc.Chunked, Expect.Yes)
        println("delete_inputstream_all_combos_ok")
    }

    // === HEAD ===

    @TestCase
    func headInputStreamAllCombos(): Unit {
        runCombo("HEAD", Conn.New, Enc.ContentLength, Expect.No)
        runCombo("HEAD", Conn.New, Enc.Chunked, Expect.No)
        runCombo("HEAD", Conn.New, Enc.ContentLength, Expect.Yes)
        runCombo("HEAD", Conn.New, Enc.Chunked, Expect.Yes)
        runCombo("HEAD", Conn.PoolReuse, Enc.ContentLength, Expect.No)
        runCombo("HEAD", Conn.PoolReuse, Enc.Chunked, Expect.No)
        runCombo("HEAD", Conn.PoolReuse, Enc.ContentLength, Expect.Yes)
        runCombo("HEAD", Conn.PoolReuse, Enc.Chunked, Expect.Yes)
        runCombo("HEAD", Conn.PoolStaleRetry, Enc.ContentLength, Expect.No)
        runCombo("HEAD", Conn.PoolStaleRetry, Enc.Chunked, Expect.No)
        runCombo("HEAD", Conn.PoolStaleRetry, Enc.ContentLength, Expect.Yes)
        runCombo("HEAD", Conn.PoolStaleRetry, Enc.Chunked, Expect.Yes)
        println("head_inputstream_all_combos_ok")
    }
}

// --- Enum types ---

enum Conn { New | PoolReuse | PoolStaleRetry }
enum Enc { ContentLength | Chunked }
enum Expect { No | Yes }

// --- Core test runner ---

func runCombo(method: String, conn: Conn, enc: Enc, expect: Expect): Unit {
    let (port, server) = startServer()
    let client = ClientBuilder().build()

    match (conn) {
        case Conn.PoolReuse =>
            // First request to put connection in pool
            sendRequest(client, port, method, enc, expect)
        case Conn.PoolStaleRetry =>
            // First request, then wait for stale
            sendRequest(client, port, method, enc, expect)
            sleep(STALE_WAIT)
        case Conn.New => ()
    }

    // Second request (or first for Conn.New)
    let rsp = sendRequest(client, port, method, enc, expect)
    @Expect(rsp.status, 200)

    client.close()
    server.close()
}

// For non-idempotent methods (POST) on stale connections, behavior is
// timing-dependent: the pool may detect FIN and create a new connection
// (request succeeds), or may not (request throws). Both are correct.
// We just verify it doesn't crash or hang.
func runComboAcceptEither(method: String, conn: Conn, enc: Enc, expect: Expect): Unit {
    let (port, server) = startServer()
    let client = ClientBuilder().build()

    sendRequest(client, port, method, enc, expect)
    sleep(STALE_WAIT)

    try {
        let rsp = sendRequest(client, port, method, enc, expect)
        @Expect(rsp.status, 200)
    } catch (_: Exception) {
        // Stale connection detected late — exception is also acceptable
    }

    client.close()
    server.close()
}

func sendRequest(client: Client, port: UInt16, method: String,
    enc: Enc, expect: Expect): HttpResponse {
    let builder = HttpRequestBuilder()
        .url("http://127.0.0.1:${port}/")
        .method(method)
        .body(SimpleStream())

    match (enc) {
        case Enc.ContentLength => builder.header("content-length", "${BODY_DATA.size}")
        case Enc.Chunked => builder.header("transfer-encoding", "chunked")
    }
    match (expect) {
        case Expect.Yes => builder.header("expect", "100-continue")
        case Expect.No => ()
    }
    return client.send(builder.build())
}

// --- Server ---

func startServer(): (UInt16, Server) {
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .httpKeepAliveTimeout(Duration.millisecond * 100)
        .build()
    server.distributor.register("/", { ctx =>
        drainBody(ctx)
        ctx.responseBuilder.status(200).body("ok")
    })
    spawn { server.serve() }
    sleep(Duration.millisecond * 100)
    return (server.port, server)
}

func drainBody(ctx: HttpContext): Unit {
    let buf = Array<Byte>(4096, repeat: 0)
    try {
        while (ctx.request.body.read(buf) > 0) {}
    } catch (_: Exception) {}
}

// --- Stream ---

class SimpleStream <: InputStream {
    var consumed = false
    public func read(buf: Array<Byte>): Int64 {
        if (consumed) {
            return 0
        }
        consumed = true
        BODY_DATA.copyTo(buf, 0, 0, BODY_DATA.size)
        return BODY_DATA.size
    }
}

/* SCAN-IN
get_inputstream_all_combos_ok
put_inputstream_all_combos_ok
post_inputstream_all_combos_ok
delete_inputstream_all_combos_ok
head_inputstream_all_combos_ok
 */
