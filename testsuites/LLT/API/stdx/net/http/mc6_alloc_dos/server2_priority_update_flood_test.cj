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
 * Test description (MC-6 mechanism 3, server side):
 *      A raw h2 client floods the server with PRIORITY_UPDATE frames carrying
 *      never-seen stream ids while never reading. With maxConcurrentStreams
 *      set to 10, the old code created a stream per frame and closed the
 *      over-limit ones with RST_STREAM, so the streams map (and the RST write
 *      backlog) grew unboundedly with attacker input. The fixed code ignores
 *      PRIORITY_UPDATE frames once the number of active client streams has
 *      reached the configured limit: no RST_STREAM is generated for them.
 *      Asserts that no RST_STREAM frame is sent back and that the connection
 *      is still alive (PING/PING-ACK round trip).
 */

package tests.mc6

import stdx.net.http.*
import stdx.net.tls.*
import std.collection.*
import std.net.*
import std.sync.*
import std.time.*
import stdx.log.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*, mc6utils.*}

@Test
class TestServer2PriorityUpdateFlood {
    static const MAX_STREAMS: UInt32 = 10
    static const FLOOD_FRAMES: Int64 = 15

    var server: ?Server = None
    var port: UInt16 = 0

    func startServer(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig())
            .maxConcurrentStreams(MAX_STREAMS).build()
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

    func priorityUpdateFrame(id: UInt32): Array<UInt8> {
        // payload: 4-byte prioritized stream id + priority field value
        let payload = ArrayList<UInt8>()
        payload.add(UInt8((id >> 24) & 0xff))
        payload.add(UInt8((id >> 16) & 0xff))
        payload.add(UInt8((id >> 8) & 0xff))
        payload.add(UInt8(id & 0xff))
        payload.add(all: "priority = u=5, i".toArray())
        return frameBytes(FT_PRIORITY_UPDATE, 0, 0, payload.toArray())
    }

    @TestCase
    func testPriorityUpdateFloodDoesNotGenerateRst(): Unit {
        startServer()
        let tls = connectRaw()
        @Assert(h2ClientHandshake(tls), true)

        // flood PRIORITY_UPDATE frames with never-seen odd stream ids
        for (i in 0..FLOOD_FRAMES) {
            tls.write(priorityUpdateFrame(UInt32(1 + i * 2)))
        }
        // a PING to verify the connection is still alive
        tls.write(frameBytes(FT_PING, 0, 0, [0, 0, 0, 0, 0, 0, 0, 1]))

        let frames = collectFrames(tls, Duration.second * 3)
        var rstCount = 0
        var pingAck = false
        for (f in frames) {
            if (f.ftype == FT_RST_STREAM) {
                rstCount++
            }
            if (f.ftype == FT_PING && (f.flags & FLAG_ACK) != 0) {
                pingAck = true
            }
        }
        @Assert(rstCount, 0)
        @Assert(pingAck, true)
        tls.close()
        asanGC()
    }
}
