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
 * Test description (MC-6 mechanism 4 extension, client side):
 *      A malicious h2 server floods zero-length DATA frames which carry no
 *      END_STREAM. They consume no flow-control credit, so the old client
 *      enqueued all of them into the unbounded inputQueue and the process
 *      memory grew unboundedly with the attacker's frame count (a few hundred
 *      bytes of object overhead per empty frame). The fixed client drops such
 *      frames on arrival, keeping memory bounded.
 *      A second case verifies legitimate zero-length DATA frames followed by
 *      real data are still delivered correctly (no interoperability break).
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
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*, mc6utils.*}

@Test
class TestClient2EmptyDataFlood {
    static const RSS_LIMIT_KB: Int64 = 12 * 1024

    var tcpServer: ?TcpServerSocket = None
    var port: UInt16 = 0
    // stop flag for the flood loop
    var stopFlood = AtomicBool(false)

    func startEvilServer(mode!: String): Unit {
        let s = TcpServerSocket(bindAt: 0)
        s.bind()
        tcpServer = s
        port = (s.localAddress as IPSocketAddress).getOrThrow().port
        stopFlood.store(false)
        spawn {
            try {
                let conn = s.accept()
                evilServe(conn, mode)
            } catch (e: Exception) {
                println("[evilServer] accept failed: ${e.message}")
            }
        }
        sleep(Duration.millisecond * 200)
    }

    func evilServe(tcpConn: TcpSocket, mode: String): Unit {
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
            var served = false
            while (!served) {
                let frame = readH2Frame(tls) ?? break
                if (frame.ftype == FT_SETTINGS && (frame.flags & FLAG_ACK) == 0) {
                    tls.write(frameBytes(FT_SETTINGS, FLAG_ACK, 0, Array<UInt8>()))
                    tls.write(frameBytes(FT_SETTINGS, 0, 0, Array<UInt8>()))
                } else if (frame.ftype == FT_HEADERS) {
                    let sid = frame.streamId
                    // response headers: :status 200 (static index 8), END_HEADERS, no END_STREAM
                    tls.write(frameBytes(FT_HEADERS, FLAG_END_HEADERS, sid, [0x88]))
                    served = true
                    if (mode == "flood") {
                        floodEmptyData(tls, sid)
                    } else {
                        // legitimate use: empty DATA frames then real data
                        let empty = frameBytes(FT_DATA, 0, sid, Array<UInt8>())
                        for (i in 0..10) {
                            tls.write(empty)
                        }
                        tls.write(frameBytes(FT_DATA, FLAG_END_STREAM, sid, "ok".toArray()))
                    }
                }
            }
            // keep serving WINDOW_UPDATE/SETTINGS frames, ignore them
            let deadline = MonoTime.now() + Duration.second * 5
            while (MonoTime.now() < deadline) {
                let frame = readH2Frame(tls)
                if (frame.isNone()) {
                    break
                }
            }
        } catch (e: Exception) {
            println("[evilServer] serve end: ${e.message}")
        }
        tls.close()
    }

    // flood zero-length DATA frames without END_STREAM for `total` duration;
    // single-frame writes keep the allocation rate moderate so that on the
    // fixed client the concurrent GC absorbs the frame-processing garbage
    // without expanding the heap, while on the vulnerable client every frame
    // is RETAINED in the unbounded inputQueue and the RSS grows steadily
    func floodEmptyData(tls: TlsSocket, streamId: UInt32): Unit {
        let empty = frameBytes(FT_DATA, 0, streamId, Array<UInt8>())
        let deadline = MonoTime.now() + Duration.second * 10
        var sent: Int64 = 0
        while (MonoTime.now() < deadline && !stopFlood.load()) {
            try {
                tls.write(empty)
            } catch (e: Exception) {
                break
            }
            sent++
        }
        println("[evilServer] empty-data flood done: ${sent} frames")
    }

    @TestCase
    func testEmptyDataFloodDoesNotFloodMemory(): Unit {
        startEvilServer(mode: "flood")
        let client = ClientBuilder().tlsConfig(clientConfig()).noProxy()
            .readTimeout(Duration.second * 30).build()
        let response = client.get("https://127.0.0.1:${port}/")

        let before = vmRssKb()
        @Assert(before > 0, true)
        // the flood runs for 10 seconds on the malicious server side, then the
        // flood thread stops; wait for it and collect the garbage produced by
        // frame processing so only LIVE data (retained frames) is measured
        sleep(Duration.second * 11)
        GC()
        sleep(Duration.millisecond * 600)
        let after = vmRssKb()

        println("[mc6] empty-data flood: RSS before=${before}kB after=${after}kB growth=${after - before}kB")
        @Assert(after - before < RSS_LIMIT_KB, true)

        response.close()
        client.close()
        tcpServer?.close()
        asanGC()
    }

    @TestCase
    func testLegitEmptyDataFramesStillWork(): Unit {
        startEvilServer(mode: "legit")
        let client = ClientBuilder().tlsConfig(clientConfig()).noProxy()
            .readTimeout(Duration.second * 10).build()
        let response = client.get("https://127.0.0.1:${port}/")

        let buf = StringBuilder()
        let chunk = Array<UInt8>(64, repeat: 0)
        var len = response.body.read(chunk)
        while (len > 0) {
            buf.append(String.fromUtf8(chunk[0..len].toArray()))
            len = response.body.read(chunk)
        }
        println("[mc6] legit empty-data: body=${buf.toString()}")
        @Assert(buf.toString(), "ok")

        response.close()
        client.close()
        tcpServer?.close()
        asanGC()
    }
}
