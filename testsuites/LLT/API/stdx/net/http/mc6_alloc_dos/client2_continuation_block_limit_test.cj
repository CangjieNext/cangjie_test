/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime License Exception.
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
 * Test description (MC-6 mechanism 1, client side):
 *      A malicious h2 server answers a request with a HEADERS frame without
 *      END_HEADERS followed by CONTINUATION frames whose accumulated size
 *      exceeds the wire envelope of the client's maxHeaderListSize (default
 *      8192, envelope 32768). The old client buffered the whole block and the
 *      resulting connection error escaped the receive coroutine: no GOAWAY,
 *      no close, the engine became a zombie and the pending request failed
 *      only via the 15s read timeout. The fixed client stops buffering at the
 *      envelope and closes the connection cleanly, so the request fails fast
 *      and the connection is actually closed (observed via socket write
 *      failures on the malicious server).
 */

package tests.mc6

import stdx.net.http.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import std.collection.*
import std.net.*
import std.sync.*
import std.time.*
import stdx.log.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*, mc6utils.*}

@Test
class TestClient2ContinuationBlockLimit {
    static const FLOOD_FRAMES: Int64 = 40
    static const CHUNK: Int64 = 1024

    var tcpServer: ?TcpServerSocket = None
    var port: UInt16 = 0
    // elapsed milliseconds until the malicious server observed a write failure
    let probeElapsedMs = AtomicInt64(-2)

    func startEvilServer(): Unit {
        let s = TcpServerSocket(bindAt: 0)
        s.bind()
        tcpServer = s
        port = (s.localAddress as IPSocketAddress).getOrThrow().port
        spawn {
            try {
                let conn = s.accept()
                evilServe(conn)
            } catch (e: Exception) {
                println("[evilServer] accept failed: ${e.message}")
            }
        }
        sleep(Duration.millisecond * 200)
    }

    func evilServe(tcpConn: TcpSocket): Unit {
        let tls = TlsSocket.server(tcpConn, serverConfig: serverConfig())
        try {
            tls.handshake()
        } catch (e: Exception) {
            println("[evilServer] handshake failed: ${e.message}")
            tls.close()
            return
        }
        try {
            tls.readTimeout = Some(Duration.second * 30)
            let preface = Array<UInt8>(h2Preface.size, repeat: 0)
            if (!readAll(tls, preface)) {
                tls.close()
                return
            }
            var answered = false
            while (!answered) {
                let frame = readH2Frame(tls)
                let f2 = frame ?? break
                if (f2.ftype == FT_SETTINGS && (f2.flags & FLAG_ACK) == 0) {
                    tls.write(frameBytes(FT_SETTINGS, FLAG_ACK, 0, Array<UInt8>()))
                    tls.write(frameBytes(FT_SETTINGS, 0, 0, Array<UInt8>()))
                } else if (f2.ftype == FT_HEADERS) {
                    // response field block without END_HEADERS, then CONTINUATION
                    // flood exceeding the client's wire envelope (32768 bytes);
                    // tolerate write failures: a compliant client closes the
                    // connection mid-flood
                    let junk = Array<UInt8>(CHUNK, repeat: UInt8(65))
                    try {
                        tls.write(frameBytes(FT_HEADERS, 0, f2.streamId, junk))
                        for (i in 0..FLOOD_FRAMES) {
                            tls.write(frameBytes(FT_CONTINUATION, 0, f2.streamId, junk))
                        }
                    } catch (e: Exception) {
                        println("[evilServer] flood interrupted: ${e.message}")
                    }
                    answered = true
                    // probe: keep writing PINGs until the client closes (or not)
                    let pr = writeProbeUntilFailure(tls, Duration.second * 4, pingProbe())
                    println("[evilServer] probe result: ${pr}ms")
                    probeElapsedMs.store(pr)
                }
            }
        } catch (e: Exception) {
            println("[evilServer] serve end: ${e.message}")
        }
        tls.close()
    }

    @TestCase
    func testClientContinuationAccumulationIsCapped(): Unit {
        startEvilServer()
        let client = ClientBuilder().tlsConfig(clientConfig()).noProxy()
            .readTimeout(Duration.second * 20).build()

        let start = MonoTime.now()
        var failed = false
        try {
            let response = client.get("https://127.0.0.1:${port}/")
            response.close()
        } catch (e: Exception) {
            failed = true
        }
        let elapsedMs = (MonoTime.now() - start).toMilliseconds()
        println("[mc6] client request failed=${failed} after ${elapsedMs}ms, server probe=${probeElapsedMs.load()}ms")

        // the request must fail fast (not via the 20s read timeout)
        @Assert(failed, true)
        @Assert(elapsedMs < 8000, true)

        // wait for the probe coroutine to observe the connection close (the
        // client closes asynchronously, the probe reports within one interval)
        var waited = 0
        while (probeElapsedMs.load() == -2 && waited < 5000) {
            sleep(Duration.millisecond * 200)
            waited += 200
        }
        let probeMs = probeElapsedMs.load()
        println("[mc6] client connection closed after ${probeMs}ms (probe wait ${waited}ms)")
        // the client must have closed the connection instead of becoming a zombie
        @Assert(probeMs >= 0, true)
        @Assert(probeMs < 4000, true)

        client.close()
        tcpServer?.close()
        asanGC()
    }
}
