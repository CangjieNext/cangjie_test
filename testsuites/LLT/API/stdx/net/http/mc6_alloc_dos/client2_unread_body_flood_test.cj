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
 * Test description (MC-6 mechanism 4, client side):
 *      A malicious but protocol-compliant h2 server answers a request with a
 *      response header and then floods DATA frames which the user never reads,
 *      respecting the flow control windows advertised by the client. The old
 *      client re-credited the stream and connection flow control windows on
 *      frame ARRIVAL, so the attacker always had fresh window and every
 *      arriving byte was buffered in the unbounded per-stream input queue; the
 *      process memory grew with the attacker's input. The fixed client only
 *      re-credits windows on consumption/drop, so the server stalls once the
 *      initial windows are exhausted and the buffered body stays small.
 *      Asserts the process RSS growth stays below a bound while the flood runs.
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
class TestClient2UnreadBodyFlood {
    static const FLOOD_BYTES: Int64 = 1024 * 1024 * 1024
    static const CHUNK: Int64 = 16384
    static const RSS_LIMIT_KB: Int64 = 64 * 1024

    var tcpServer: ?TcpServerSocket = None
    var port: UInt16 = 0

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

    // minimal evil h2 server: handshake, answer the first HEADERS with a
    // header-only response (no END_STREAM), then flood DATA frames within the
    // flow control windows the client advertises
    func evilServe(tcpConn: TcpSocket): Unit {
        let tls = TlsSocket.server(tcpConn, serverConfig: serverConfig())
        try {
            tls.handshake()
        } catch (e: Exception) {
            println("[evilServer] handshake failed: ${e.message}")
            tls.close()
            return
        }
        let connWin = AtomicInt64(65535)
        let streamWin = AtomicInt64(65535)
        try {
            tls.readTimeout = Some(Duration.second * 30)
            let preface = Array<UInt8>(h2Preface.size, repeat: 0)
            if (!readAll(tls, preface)) {
                tls.close()
                return
            }
            var flooded = false
            while (!flooded) {
                let frame = readH2Frame(tls) ?? break
                if (frame.ftype == FT_SETTINGS && (frame.flags & FLAG_ACK) == 0) {
                    // ack client settings, then send our settings
                    tls.write(frameBytes(FT_SETTINGS, FLAG_ACK, 0, Array<UInt8>()))
                    tls.write(frameBytes(FT_SETTINGS, 0, 0, Array<UInt8>()))
                } else if (frame.ftype == FT_WINDOW_UPDATE) {
                    let inc = (Int64(frame.payload[0]) << 24) + (Int64(frame.payload[1]) << 16)
                        + (Int64(frame.payload[2]) << 8) + Int64(frame.payload[3])
                    if (frame.streamId == 0) {
                        connWin.fetchAdd(inc)
                    } else {
                        streamWin.fetchAdd(inc)
                    }
                } else if (frame.ftype == FT_HEADERS) {
                    // response headers: :status 200 (static index 8), END_HEADERS, no END_STREAM
                    tls.write(frameBytes(FT_HEADERS, FLAG_END_HEADERS, frame.streamId, [0x88]))
                    let sid = frame.streamId
                    flooded = true
                    // reader thread keeps crediting windows while the flood runs
                    spawn {
                        creditLoop(tls, connWin, streamWin)
                    }
                    floodData(tls, sid, connWin, streamWin)
                }
            }
        } catch (e: Exception) {
            // connection closed or peer stalled, expected when the flood stalls
            println("[evilServer] serve end: ${e.message}")
        }
        tls.close()
    }

    func creditLoop(tls: TlsSocket, connWin: AtomicInt64, streamWin: AtomicInt64): Unit {
        while (true) {
            let frame = readH2Frame(tls)
            match (frame) {
                case Some(f) =>
                    if (f.ftype == FT_WINDOW_UPDATE) {
                        let inc = (Int64(f.payload[0]) << 24) + (Int64(f.payload[1]) << 16)
                            + (Int64(f.payload[2]) << 8) + Int64(f.payload[3])
                        if (f.streamId == 0) {
                            connWin.fetchAdd(inc)
                        } else {
                            streamWin.fetchAdd(inc)
                        }
                    }
                case None => break
            }
        }
    }

    func floodData(tls: TlsSocket, streamId: UInt32, connWin: AtomicInt64, streamWin: AtomicInt64): Unit {
        let payload = Array<UInt8>(CHUNK, repeat: UInt8(0x41))
        var sent: Int64 = 0
        while (sent < FLOOD_BYTES) {
            // respect both flow control windows
            var waited = 0
            while ((connWin.load() < CHUNK || streamWin.load() < CHUNK) && waited < 30000) {
                sleep(Duration.millisecond * 10)
                waited += 10
            }
            if (connWin.load() < CHUNK || streamWin.load() < CHUNK) {
                break
            }
            tls.write(frameBytes(FT_DATA, 0, streamId, payload))
            connWin.fetchSub(CHUNK)
            streamWin.fetchSub(CHUNK)
            sent += CHUNK
        }
        println("[evilServer] flood done: sent ${sent} bytes")
    }

    @TestCase
    func testUnreadResponseBodyDoesNotFloodMemory(): Unit {
        startEvilServer()
        let client = ClientBuilder().tlsConfig(clientConfig()).noProxy()
            .readTimeout(Duration.second * 30).build()
        let response = client.get("https://127.0.0.1:${port}/")

        // headers received, body is never read from here on
        let before = vmRssKb()
        @Assert(before > 0, true)
        // give the malicious server time to pump data
        sleep(Duration.second * 3)
        let after = vmRssKb()

        println("[mc6] RSS before=${before}kB after=${after}kB growth=${after - before}kB")
        @Assert(after - before < RSS_LIMIT_KB, true)

        response.close()
        client.close()
        tcpServer?.close()
        asanGC()
    }
}
