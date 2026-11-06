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
 * Test description (CR-3, positive path):
 * RFC 9113 section 6.9.1 allows a peer to advertise SETTINGS_INITIAL_WINDOW_SIZE
 * of 0. A raw HTTP/2 server does exactly that and only opens the stream window
 * (WINDOW_UPDATE) after the request HEADERS arrive, which is a legal pacing
 * pattern for a slow consumer. A streaming (InputStream) request body must then
 * be delivered in full: the client blocks on flow control, resumes after the
 * WINDOW_UPDATE and sends all body bytes.
 *
 * The buggy client computed maxFrameSize = 0 at entry of
 * ClientStream.writeNormalBody, read into a zero-size buffer, got len == 0,
 * broke out of the copy loop and sent an empty DATA frame with END_STREAM,
 * silently truncating the request body while the server still answered 200.
 *
 * Test API:
 *   Client.send(HttpRequest) with an InputStream body (writeNormalBody path)
 *   raw HTTP/2 server over real TLS (self-signed certificates from ../config)
 */

package tests.client2_0

import stdx.net.http.*
import stdx.net.tls.*
import std.collection.*
import std.net.*
import std.sync.*
import std.time.*
import std.io.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

// ---- minimal HTTP/2 wire helpers for the raw server side ----

const CR3_FT_DATA: UInt8 = 0
const CR3_FT_HEADERS: UInt8 = 1
const CR3_FT_SETTINGS: UInt8 = 4
const CR3_FT_WINDOW_UPDATE: UInt8 = 8
const CR3_FLAG_END_STREAM: UInt8 = 0x1
const CR3_FLAG_END_HEADERS: UInt8 = 0x4
const CR3_FLAG_ACK: UInt8 = 0x1

let cr3ClientPreface = "PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n".toArray()

class Cr3H2Frame {
    let ftype: UInt8
    let flags: UInt8
    let streamId: UInt32
    let payload: Array<UInt8>

    init(ftype: UInt8, flags: UInt8, streamId: UInt32, payload: Array<UInt8>) {
        this.ftype = ftype
        this.flags = flags
        this.streamId = streamId
        this.payload = payload
    }
}

func cr3FrameBytes(t: UInt8, flags: UInt8, streamId: UInt32, payload: Array<UInt8>): Array<UInt8> {
    let len = payload.size
    let out = ArrayList<UInt8>()
    out.add(UInt8((UInt32(len) >> 16) & 0xff))
    out.add(UInt8((UInt32(len) >> 8) & 0xff))
    out.add(UInt8(UInt32(len) & 0xff))
    out.add(t)
    out.add(flags)
    out.add(UInt8((streamId >> 24) & 0xff))
    out.add(UInt8((streamId >> 16) & 0xff))
    out.add(UInt8((streamId >> 8) & 0xff))
    out.add(UInt8(streamId & 0xff))
    out.add(all: payload)
    return out.toArray()
}

func cr3U32be(v: UInt32): Array<UInt8> {
    return [UInt8((v >> 24) & 0xff), UInt8((v >> 16) & 0xff), UInt8((v >> 8) & 0xff), UInt8(v & 0xff)]
}

func cr3ReadAll(conn: TlsSocket, buf: Array<UInt8>): Bool {
    var got: Int64 = 0
    while (got < buf.size) {
        var n: Int64 = 0
        try {
            let tmp = Array<UInt8>(buf.size - got, repeat: 0)
            n = conn.read(tmp)
            if (n <= 0) {
                return false
            }
            tmp.copyTo(buf, 0, got, n)
        } catch (e: Exception) {
            return false
        }
        got += n
    }
    return true
}

// read one h2 frame, None on EOF/timeout/error
func cr3ReadH2Frame(conn: TlsSocket): ?Cr3H2Frame {
    let head = Array<UInt8>(9, repeat: 0)
    if (!cr3ReadAll(conn, head)) {
        return None
    }
    let len = (Int64(head[0]) << 16) + (Int64(head[1]) << 8) + Int64(head[2])
    let payload = Array<UInt8>(len, repeat: 0)
    if (len > 0 && !cr3ReadAll(conn, payload)) {
        return None
    }
    let streamId = (UInt32(head[5]) << 24) + (UInt32(head[6]) << 16) + (UInt32(head[7]) << 8) + UInt32(head[8])
    return Some(Cr3H2Frame(head[3], head[4], streamId & 0x7fffffff, payload))
}

@Test
class TestZeroInitialWindowBodyFlow {
    var tcpServer: ?TcpServerSocket = None
    var port: UInt16 = 0
    // body bytes received on the request stream
    let recvTotal = AtomicInt64(0)
    // body bytes matching the FixedBody fill pattern (42)
    let recvMatch = AtomicInt64(0)
    // whether a DATA frame with END_STREAM arrived
    let gotEndStream = AtomicBool(false)
    // whether the raw server actually opened the stream window
    let streamWindowOpened = AtomicBool(false)

    func startRawServer(): Unit {
        let s = TcpServerSocket(bindAt: 0)
        s.bind()
        tcpServer = s
        port = (s.localAddress as IPSocketAddress).getOrThrow().port
        spawn {
            try {
                let conn = s.accept()
                rawServe(conn)
            } catch (e: Exception) {
                println("[rawServer] accept failed: ${e.message}")
            }
        }
        sleep(Duration.millisecond * 200)
    }

    func rawServe(tcpConn: TcpSocket): Unit {
        let tls = TlsSocket.server(tcpConn, serverConfig: serverConfig())
        try {
            tls.handshake()
        } catch (e: Exception) {
            println("[rawServer] handshake failed: ${e.message}")
            tls.close()
            return
        }
        try {
            tls.readTimeout = Some(Duration.second * 30)
            let preface = Array<UInt8>(cr3ClientPreface.size, repeat: 0)
            if (!cr3ReadAll(tls, preface)) {
                tls.close()
                return
            }
            // server connection preface: SETTINGS with INITIAL_WINDOW_SIZE = 0,
            // which is legal (RFC 9113 section 6.9.1) and accepted by the client
            tls.write(cr3FrameBytes(CR3_FT_SETTINGS, 0, 0, [0x00, 0x04, 0x00, 0x00, 0x00, 0x00]))
            var responded = false
            while (!responded) {
                let frame = cr3ReadH2Frame(tls) ?? break
                if (frame.ftype == CR3_FT_SETTINGS && (frame.flags & CR3_FLAG_ACK) == 0) {
                    // ack the client's settings
                    tls.write(cr3FrameBytes(CR3_FT_SETTINGS, CR3_FLAG_ACK, 0, Array<UInt8>()))
                    // keep the connection-level window open for the whole body
                    tls.write(cr3FrameBytes(CR3_FT_WINDOW_UPDATE, 0, 0, cr3U32be(UInt32(1000000))))
                } else if (frame.ftype == CR3_FT_HEADERS) {
                    // pace like a slow consumer: open the stream window only after
                    // the request headers arrived; the extra headroom (200000 for a
                    // 100000-byte body) keeps the window positive at body EOF
                    sleep(Duration.millisecond * 300)
                    tls.write(cr3FrameBytes(CR3_FT_WINDOW_UPDATE, 0, frame.streamId, cr3U32be(UInt32(200000))))
                    streamWindowOpened.store(true)
                } else if (frame.ftype == CR3_FT_DATA) {
                    let n = Int64(frame.payload.size)
                    recvTotal.fetchAdd(n)
                    for (b in frame.payload) {
                        if (b == 42u8) {
                            recvMatch.fetchAdd(1)
                        }
                    }
                    if ((frame.flags & CR3_FLAG_END_STREAM) != 0) {
                        gotEndStream.store(true)
                        // response: :status 200 (HPACK static index 8), END_HEADERS | END_STREAM
                        tls.write(cr3FrameBytes(CR3_FT_HEADERS, CR3_FLAG_END_HEADERS | CR3_FLAG_END_STREAM,
                            frame.streamId, [0x88]))
                        responded = true
                    }
                }
            }
            // drain until the client closes (GOAWAY/EOF), bounded wait
            tls.readTimeout = Some(Duration.second * 3)
            let deadline = MonoTime.now() + Duration.second * 3
            while (MonoTime.now() < deadline) {
                let frame = cr3ReadH2Frame(tls)
                if (frame.isNone()) {
                    break
                }
            }
        } catch (e: Exception) {
            println("[rawServer] serve end: ${e.message}")
        }
        tls.close()
    }

    @TestCase
    func testStreamBodyFlowsAfterWindowUpdate(): Unit {
        startRawServer()
        let client = ClientBuilder().tlsConfig(clientConfig()).noProxy().build()
        // unknown body size -> streaming InputStream -> writeNormalBody path
        let req = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${port}/flow")
            .body(PatternBody(100000))
            .writeTimeout(Duration.second * 10)
            .build()
        let resp = client.send(req)
        @Expect(resp.status, UInt16(200))
        resp.close()
        @Expect(streamWindowOpened.load(), true)
        @Expect(recvTotal.load(), 100000)
        @Expect(recvMatch.load(), 100000)
        @Expect(gotEndStream.load(), true)
        client.close()
        tcpServer?.close()
        asanGC()
    }
}

class PatternBody <: InputStream {
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
