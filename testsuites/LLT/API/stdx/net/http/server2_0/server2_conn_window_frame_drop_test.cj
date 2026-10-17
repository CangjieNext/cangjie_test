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
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f asan.%middle tlsconfig.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *     Regression test for MC-5: when the connection-level flow-control window is
 * exhausted, the HTTP/2 server write thread used to remove a DATA frame from
 * toWriteFrames before attempting the write, so the frame was silently dropped
 * when the write was rejected (`no enough window on connection level`). The
 * UnblockFrame retry triggered by a later connection-level WINDOW_UPDATE could
 * never redeliver it: the response body was lost forever while the handler
 * believed it had been sent.
 *     Scenario: a raw h2 client (TLS + ALPN) sends two GET requests on one
 * connection and withholds WINDOW_UPDATE. "/fill" responds with 65535 bytes,
 * exactly the initial connection window (RFC 9113 section 5.2.1); "/victim"
 * responds 500ms later with 16384 bytes, which can no longer fit into the
 * exhausted window. Once "/fill" is fully received, the client sends a
 * connection-level WINDOW_UPDATE(65535).
 *     Expected behavior: the victim's DATA frame must stay queued and be
 * delivered after the WINDOW_UPDATE (headers + 16384 body bytes + END_STREAM).
 * Buggy behavior: victim HEADERS arrive but its DATA frame never does.
 */

package tests.server2_0

import stdx.net.http.*
import stdx.net.tls.*
import std.net.*
import std.io.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

const CONN_WINDOW_SIZE: Int64 = 65535 // initial HTTP/2 connection flow-control window (RFC 9113 5.2.1)
const VICTIM_BODY_SIZE: Int64 = 16384 // default max frame size

let CLIENT_PREFACE: Array<UInt8> = "PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n".toArray()
let EMPTY_SETTINGS: Array<UInt8> = [0, 0, 0, 4, 0, 0, 0, 0, 0]
let SETTINGS_ACK: Array<UInt8> = [0, 0, 0, 4, 1, 0, 0, 0, 0]

@Test
class TestServer2ConnWindowFrameDrop {
    let fillBody = FixedBody(CONN_WINDOW_SIZE)
    let victimBody = String.fromUtf8(Array<UInt8>(VICTIM_BODY_SIZE, repeat: b'v'))
    var server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func testConnWindowFrameDrop(): Unit {
        startServer()
        let tcp = TcpSocket("127.0.0.1", server.port)
        tcp.readTimeout = Duration.second * 10 // deadline for the whole read loop
        tcp.connect()
        let tls = TlsSocket.client(tcp, clientConfig: clientConfig())
        tls.handshake()

        let authority = "127.0.0.1:${server.port}"
        let out = ArrayList<UInt8>()
        appendAll(out, CLIENT_PREFACE)
        appendAll(out, EMPTY_SETTINGS)
        appendAll(out, headersFrame(1, authority, "/fill"))
        appendAll(out, headersFrame(3, authority, "/victim"))
        tls.write(out.toArray())

        var fillBytes: Int64 = 0
        var fillEnd = false
        var victimHeaders = false
        var victimBytes: Int64 = 0
        var victimEnd = false
        var windowUpdated = false

        try {
            while (!(victimEnd && victimBytes == VICTIM_BODY_SIZE)) {
                let head = readExact(tls, 9)
                let len = Int64(head[0]) << 16 | Int64(head[1]) << 8 | Int64(head[2])
                let ftype = head[3]
                let flags = head[4]
                let sid = UInt32(head[5]) << 24 | UInt32(head[6]) << 16 | UInt32(head[7]) << 8 | UInt32(head[8])
                let payload = readExact(tls, len)
                if (ftype == 0x00) { // DATA
                    if (sid == 1) {
                        fillBytes += len
                        if ((flags & 0x01) != 0) {
                            fillEnd = true
                        }
                    }
                    if (sid == 3) {
                        victimBytes += len
                        if ((flags & 0x01) != 0) {
                            victimEnd = true
                        }
                    }
                } else if (ftype == 0x01) { // HEADERS
                    if (sid == 3) {
                        victimHeaders = true
                    }
                } else if (ftype == 0x04) { // SETTINGS: ack the server's SETTINGS
                    if ((flags & 0x01) == 0) {
                        tls.write(SETTINGS_ACK)
                    }
                } else if (ftype == 0x06) { // PING: reply with ACK + same payload
                    if ((flags & 0x01) == 0) {
                        let pong = ArrayList<UInt8>()
                        appendAll(pong, frameHeader(len, 0x06, 0x01, 0))
                        appendAll(pong, payload)
                        tls.write(pong.toArray())
                    }
                } else if (ftype == 0x07) { // GOAWAY
                    break
                }
                // replenish the connection window only after /fill has been fully consumed
                // and a grace period has passed, so the server experiences the window-exhausted
                // window during which the victim DATA frame gets dequeued; never send any
                // stream-level WINDOW_UPDATE
                if (fillEnd && fillBytes == CONN_WINDOW_SIZE && !windowUpdated) {
                    windowUpdated = true
                    sleep(Duration.millisecond * 300)
                    tls.write(windowUpdateFrame(0, UInt32(CONN_WINDOW_SIZE)))
                }
            }
        } catch (e: Exception) {
            // deadline (read timeout) or closed connection: fall through to assertions
            println("[conn-window-drop-test] read loop ended: ${e}")
        }

        println("[conn-window-drop-test] fill: bytes=${fillBytes} end=${fillEnd}; "
            + "victim: headers=${victimHeaders} bytes=${victimBytes} end=${victimEnd}")

        // sanity: the fill stream is fully received and consumed
        @Expect(fillBytes, CONN_WINDOW_SIZE)
        @Assert(fillEnd)
        @Assert(victimHeaders)
        // regression assertions for MC-5: the dequeued victim DATA frame must survive
        // connection-window exhaustion and be delivered after the WINDOW_UPDATE
        @Expect(victimBytes, VICTIM_BODY_SIZE)
        @Assert(victimEnd)

        tls.close()
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server.distributor.register("/fill", { ctx => ctx.responseBuilder.body(fillBody) })
        server.distributor.register("/victim", { ctx =>
            sleep(Duration.millisecond * 100) // queue victim frames behind all /fill frames
            ctx.responseBuilder.body(victimBody)
        })
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond * 10)
        }
    }
}

// body stream that always reads exactly min(totalSize, buffer.size) bytes,
// so the response totals exactly the requested size
class FixedBody <: InputStream {
    var totalSize: Int64

    public init(size: Int64) {
        totalSize = size
    }

    public func read(buffer: Array<Byte>): Int64 {
        if (totalSize <= 0) {
            return -1
        }
        let len = if (totalSize < buffer.size) { totalSize } else { buffer.size }
        for (i in 0..len) {
            buffer[i] = b'f'
        }
        totalSize -= len
        return len
    }
}

func appendAll(out: ArrayList<UInt8>, bytes: Array<UInt8>): Unit {
    for (b in bytes) {
        out.add(b)
    }
}

func frameHeader(len: Int64, ftype: UInt8, flags: UInt8, streamId: UInt32): Array<UInt8> {
    [
        UInt8((len >> 16) & 0xFF), UInt8((len >> 8) & 0xFF), UInt8(len & 0xFF),
        ftype, flags,
        UInt8((streamId >> 24) & 0xFF), UInt8((streamId >> 16) & 0xFF),
        UInt8((streamId >> 8) & 0xFF), UInt8(streamId & 0xFF)
    ]
}

// HPACK: literal header field without indexing with a new name
func hpackLiteral(name: String, value: String): Array<UInt8> {
    let out = ArrayList<UInt8>()
    out.add(0x00)
    let nb = name.toArray()
    out.add(UInt8(nb.size))
    appendAll(out, nb)
    let vb = value.toArray()
    out.add(UInt8(vb.size))
    appendAll(out, vb)
    out.toArray()
}

func requestHeadersBlock(authority: String, path: String): Array<UInt8> {
    let out = ArrayList<UInt8>()
    appendAll(out, hpackLiteral(":method", "GET"))
    appendAll(out, hpackLiteral(":scheme", "https"))
    appendAll(out, hpackLiteral(":authority", authority))
    appendAll(out, hpackLiteral(":path", path))
    out.toArray()
}

// HEADERS frame with END_HEADERS | END_STREAM
func headersFrame(streamId: UInt32, authority: String, path: String): Array<UInt8> {
    let block = requestHeadersBlock(authority, path)
    let out = ArrayList<UInt8>()
    appendAll(out, frameHeader(block.size, 0x01, 0x05, streamId))
    appendAll(out, block)
    out.toArray()
}

func windowUpdateFrame(streamId: UInt32, increment: UInt32): Array<UInt8> {
    let out = ArrayList<UInt8>()
    appendAll(out, frameHeader(4, 0x08, 0x00, streamId))
    out.add(UInt8((increment >> 24) & 0xFF))
    out.add(UInt8((increment >> 16) & 0xFF))
    out.add(UInt8((increment >> 8) & 0xFF))
    out.add(UInt8(increment & 0xFF))
    out.toArray()
}

// read exactly n bytes from the connection
func readExact(conn: TlsSocket, n: Int64): Array<UInt8> {
    let result = ArrayList<UInt8>()
    while (result.size < n) {
        let buf = Array<UInt8>(n - result.size, repeat: 0)
        let r = conn.read(buf)
        if (r <= 0) {
            throw Exception("connection closed while reading ${n} bytes, got ${result.size}")
        }
        for (i in 0..r) {
            result.add(buf[i])
        }
    }
    result.toArray()
}
