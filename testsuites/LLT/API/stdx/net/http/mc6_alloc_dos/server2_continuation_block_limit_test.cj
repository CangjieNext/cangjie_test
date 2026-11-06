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
// DEPENDENCE: ./common.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt ./common.cj -o common.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle tlsconfig.%middle common.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description (MC-6 mechanism 1, server side):
 *      A raw h2 client sends a HEADERS frame without END_HEADERS followed by
 *      CONTINUATION frames whose accumulated size exceeds the wire envelope of
 *      the configured maxHeaderListSize (1024 here). The server must stop
 *      buffering and close the connection instead of accumulating unbounded
 *      CONTINUATION fragments before any validation. GOAWAY delivery is not
 *      guaranteed, so the close is observed through socket write failures.
 *      A positive control checks that a legitimate header block split across
 *      HEADERS + CONTINUATION (total below the limit) is still accepted.
 */

package tests.mc6

import stdx.net.http.*
import stdx.net.tls.*
import std.net.*
import std.sync.*
import std.time.*
import stdx.log.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*, mc6utils.*}

@Test
class TestServer2ContinuationBlockLimit {
    static const CAP: UInt32 = 1024

    var server: ?Server = None
    var port: UInt16 = 0

    func startServer(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig())
            .maxHeaderListSize(CAP).build()
        s.distributor.register("/", {ctx => ctx.responseBuilder.body("ok")})
        server = s
        spawn {
            s.serve()
        }
        sleep(Duration.millisecond * 500)
        port = s.port
    }

    func connectRaw(): TlsSocket {
        let tcp = TcpSocket("127.0.0.1", port)
        tcp.connect()
        let tls = TlsSocket.client(tcp, clientConfig: clientConfig())
        tls.handshake()
        return tls
    }

    @TestCase
    func testContinuationAccumulationIsCapped(): Unit {
        startServer()
        let tls = connectRaw()
        @Assert(h2ClientHandshake(tls), true)

        // HEADERS without END_HEADERS, then CONTINUATION frames until the
        // accumulated block exceeds the wire envelope of the 1024 cap (4096),
        // and keep writing afterwards: a compliant server closes the connection
        // shortly after the breach, which surfaces as socket write failures;
        // a vulnerable server keeps consuming the flood without ever closing
        let junk = Array<UInt8>(1000, repeat: UInt8(65))
        let flood = frameBytes(FT_CONTINUATION, 0, 1, junk)
        tls.write(frameBytes(FT_HEADERS, 0, 1, junk))
        let elapsedMs = writeProbeUntilFailure(tls, Duration.second * 6, flood,
            interval: Duration.millisecond * 50)
        println("[mc6] continuation flood: connection closed after ${elapsedMs}ms")
        @Assert(elapsedMs >= 0, true)
        @Assert(elapsedMs < 5000, true)
        tls.close()
        asanGC()
    }

    @TestCase
    func testLegitSplitHeaderBlockStillWorks(): Unit {
        // positive control: block below the cap split across HEADERS + CONTINUATION
        let block = getHeaderBlock()
        let half = block.size / 2
        let first = Array<UInt8>(half, repeat: 0)
        let second = Array<UInt8>(block.size - half, repeat: 0)
        for (i in 0..half) {
            first[i] = block[i]
        }
        for (i in 0..(block.size - half)) {
            second[i] = block[Int64(i) + half]
        }

        let tls = connectRaw()
        @Assert(h2ClientHandshake(tls), true)
        tls.write(frameBytes(FT_HEADERS, FLAG_END_STREAM, 1, first))
        tls.write(frameBytes(FT_CONTINUATION, FLAG_END_HEADERS, 1, second))

        let frames = collectFrames(tls, Duration.second * 5)
        var gotResponse = false
        for (f in frames) {
            if (f.ftype == FT_HEADERS) {
                gotResponse = true
            }
        }
        @Assert(gotResponse, true)
        tls.close()
        asanGC()
    }

    @TestCase
    func testServerSurvivesAfterCappedConnection(): Unit {
        startServer()
        let client = ClientBuilder().tlsConfig(clientConfig()).noProxy().build()
        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${port}/")
            .build()
        let response = client.send(request)
        let buf = Array<UInt8>(16, repeat: 0)
        let n = response.body.read(buf)
        @Assert(String.fromUtf8(buf[0..n]), "ok")
        client.close()
        asanGC()
    }
}
