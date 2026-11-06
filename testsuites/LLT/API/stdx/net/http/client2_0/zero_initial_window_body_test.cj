/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
// DEPENDENCE: ../../../../asan
// DEPENDENCE: ../config
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle tlsconfig.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 * RFC 9113 section 6.9.1 allows a peer to advertise SETTINGS_INITIAL_WINDOW_SIZE
 * of 0. When the server does so (and never sends a stream WINDOW_UPDATE), a
 * streaming (InputStream) request body must not be silently dropped: the client
 * used to compute maxFrameSize = 0 at entry of ClientStream.writeNormalBody,
 * read into a zero-size buffer, get len == 0, break out of the loop and send an
 * empty DATA frame with END_STREAM. The client then received a normal 200
 * response while the server saw an empty request body.
 *
 * Test API:
 *   ServerBuilder().initialWindowSize(0)
 *   Client.send(HttpRequest) with InputStream body
 *
 * Fixed behavior: the client blocks on flow control until a WINDOW_UPDATE (or
 * write timeout / stream close) happens; here the server never opens the
 * window, so the request must fail with an exception instead of returning a
 * silent 200.
 */

package tests.client2_0

import stdx.net.http.*
import std.io.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestZeroInitialWindowBody {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).initialWindowSize(0).build()
    let recvSize = AtomicInt64(-1)

    @TestCase
    func testStreamBodyWithZeroInitialWindow(): Unit {
        startServer()
        let client = ClientBuilder().tlsConfig(clientConfig()).noProxy().build()
        sleep(Duration.second)
        // unknown body size -> streaming InputStream -> writeNormalBody path
        let req = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/hd1")
            .body(FixedBody(100000))
            .writeTimeout(Duration.second * 2)
            .build()
        var silentResponse = false
        try {
            let resp = client.send(req)
            silentResponse = true
            println("client got status ${resp.status} while server received ${recvSize.load()} body bytes")
        } catch (e: Exception) {
            println("client failed as expected: ${e}")
        }
        @Expect(silentResponse, false)
        client.close()
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server.distributor.register("/hd1", {ctx =>
            let buf = Array<Byte>(65536, repeat: 0)
            var total = 0
            while (true) {
                let len = ctx.request.body.read(buf)
                if (len <= 0) {
                    break
                }
                total += len
            }
            recvSize.store(total)
            ctx.responseBuilder.body("OK")
        })
        spawn {
            server.serve()
        }
    }
}

class FixedBody <: InputStream {
    var pos: Int64 = 0
    let data: Array<UInt8>
    init(size: Int64) {
        data = Array<UInt8>(size, repeat: 42)
    }
    public func read(buf: Array<UInt8>): Int64 {
        if (pos >= data.size) {
            return 0
        }
        let n = min(Int64(buf.size), data.size - pos)
        for (i in 0..n) {
            buf[i] = data[pos + i]
        }
        pos += n
        return n
    }
}
