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
 *      RFC 7541 section 4.4 requires that an attempt to add an entry which is
 *      larger than the maximum size of the dynamic table causes the table to
 *      be emptied of all existing entries, and results in an empty table. The
 *      oversized entry itself must NOT be inserted.
 *
 *      This test opens a raw HTTP/2 connection (TLS + ALPN "h2") to the
 *      server and sends:
 *        - stream 1: a HEADERS frame with pseudo headers plus a literal
 *          header field with incremental indexing (0x40) whose size
 *          (name + value + 32 = 4142) exceeds the default dynamic table
 *          size (4096);
 *        - stream 3: a HEADERS frame with pseudo headers plus an indexed
 *          header field referencing dynamic table index 62 (0xBE).
 *
 *      Expected (compliant) behavior: the oversized entry is not inserted
 *      into the dynamic table, so index 62 is invalid. Decoding of the
 *      stream 3 header block fails with HpackException, which makes the
 *      server treat it as a connection error of type COMPRESSION_ERROR and
 *      tear the connection down; the request on stream 3 is never served.
 *
 *      Buggy behavior: the oversized entry is inserted despite exceeding
 *      maxSize, index 62 resolves to it, and the request on stream 3 is
 *      served normally (a HEADERS response frame arrives on stream 3).
 *
 *      A companion scenario checks that a normal-sized entry (140 octets)
 *      is still inserted and referenceable via index 62.
 *
 * Test API:
 *      HeaderTable#insert (indirectly, via HTTP/2 HPACK decoding on server side)
 */

package tests.hpack

import stdx.net.http.*
import stdx.net.tls.*
import std.net.*
import std.time.*
import std.sync.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

let H2_FRAME_HEADERS: UInt8 = 0x01
let H2_FRAME_GOAWAY: UInt8 = 0x07
let H2_ERROR_COMPRESSION: UInt32 = 0x09

let H2_PREFACE = "PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n".toArray()
let H2_EMPTY_SETTINGS: Array<UInt8> = [0, 0, 0, 4, 0, 0, 0, 0, 0]
let H2_SETTINGS_ACK: Array<UInt8> = [0, 0, 0, 4, 1, 0, 0, 0, 0]

struct H2Frame {
    H2Frame(let frameType: UInt8, let streamId: UInt32, let payload: Array<UInt8>) {}
}

struct ScenarioResult {
    ScenarioResult(let goawayErrorCode: ?UInt32, let stream3Responded: Bool) {}
}

@Test
class TestHpackOversizedDynamicTableEntry {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func testOversizedEntryNotInserted(): Unit {
        startServer()

        // Scenario 1 (regression): a normal-sized entry is inserted into the
        // dynamic table and can be referenced via index 62 later.
        let normal = runScenario(oversize: false)
        @Expect(normal.goawayErrorCode.isNone(), true)
        @Expect(normal.stream3Responded, true)

        // Scenario 2 (bug fix): an entry larger than maxSize must not be
        // inserted; index 62 stays invalid, decoding of the stream 3 header
        // block fails with HpackException (COMPRESSION_ERROR on server side)
        // and the request on stream 3 is never served.
        let oversize = runScenario(oversize: true)
        println("oversize scenario: goawayErrorCode=${oversize.goawayErrorCode}, stream3Responded=${oversize.stream3Responded}")
        @Expect(oversize.stream3Responded, false)

        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("ok")
        })
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 100)
    }

    /*
     * Open a raw h2 connection, send the two HEADERS frames described above
     * and collect the observable behavior of the server.
     */
    func runScenario(oversize!: Bool): ScenarioResult {
        let tcp = TcpSocket("127.0.0.1", server.port)
        tcp.connect()
        tcp.readTimeout = Duration.second * 5
        let tlsClient = TlsSocket.client(tcp, clientConfig: clientConfig())
        tlsClient.handshake()
        tlsClient.write(H2_PREFACE)
        tlsClient.write(H2_EMPTY_SETTINGS)
        sleep(Duration.millisecond * 100)
        tlsClient.write(H2_SETTINGS_ACK)
        tlsClient.write(buildFrame(buildStream1HeaderBlock(oversize: oversize), frameType: H2_FRAME_HEADERS,
            flags: 0x05, streamId: 1)) // END_STREAM | END_HEADERS
        tlsClient.write(buildFrame(buildStream3HeaderBlock(), frameType: H2_FRAME_HEADERS,
            flags: 0x05, streamId: 3)) // END_STREAM | END_HEADERS

        var goawayErrorCode: ?UInt32 = None
        var stream3Responded = false
        try {
            while (true) {
                let frame = readFrame(tlsClient) ?? break
                if (frame.frameType == H2_FRAME_GOAWAY) {
                    goawayErrorCode = parseGoawayErrorCode(frame.payload)
                    break
                }
                if (frame.frameType == H2_FRAME_HEADERS && frame.streamId == 3) {
                    stream3Responded = true
                    break
                }
            }
        } catch (e: Exception) {
            // read timeout or connection closed by peer: stop reading
        }
        tlsClient.close()
        return ScenarioResult(goawayErrorCode, stream3Responded)
    }
}

/*
 * Stream 1 header block:
 *   - pseudo headers via static table indexes (:method GET, :path /, :scheme https)
 *   - :authority as a literal without indexing
 *   - a new field inserted with incremental indexing (0x40):
 *       oversize == true : "x-oversize: aaaa...", value length 4100,
 *                          fieldSize = 10 + 4100 + 32 = 4142 > 4096
 *       oversize == false: "x-normal: aaaa...", value length 100,
 *                          fieldSize = 8 + 100 + 32 = 140 <= 4096
 */
func buildStream1HeaderBlock(oversize!: Bool): Array<UInt8> {
    let block = ArrayList<UInt8>()
    block.add(0x82) // indexed field: :method GET (static index 2)
    block.add(0x84) // indexed field: :path / (static index 4)
    block.add(0x87) // indexed field: :scheme https (static index 7)
    block.add(0x01) // literal without indexing, name: :authority (static index 1)
    block.add(0x09) // value length 9
    block.add(all: "127.0.0.1".toArray())
    block.add(0x40) // literal with incremental indexing, new name
    if (oversize) {
        block.add(0x0A) // name length 10
        block.add(all: "x-oversize".toArray())
        // value length 4100 encoded as HPACK integer: 127 + (5 + 31 * 128)
        block.add(0x7F)
        block.add(0x85)
        block.add(0x1F)
        block.add(all: Array<UInt8>(4100, repeat: 0x61)) // 'a' * 4100
    } else {
        block.add(0x08) // name length 8
        block.add(all: "x-normal".toArray())
        block.add(0x64) // value length 100
        block.add(all: Array<UInt8>(100, repeat: 0x61)) // 'a' * 100
    }
    return block.toArray()
}

/*
 * Stream 3 header block: pseudo headers plus an indexed header field
 * referencing dynamic table index 62 (0x80 | 62 = 0xBE), i.e. the entry
 * inserted on stream 1 (if any).
 */
func buildStream3HeaderBlock(): Array<UInt8> {
    let block = ArrayList<UInt8>()
    block.add(0x82)
    block.add(0x84)
    block.add(0x87)
    block.add(0x01)
    block.add(0x09)
    block.add(all: "127.0.0.1".toArray())
    block.add(0xBE) // indexed field: dynamic table index 62
    return block.toArray()
}

func addAllBytes(list: ArrayList<UInt8>, bytes: Array<UInt8>): Unit {
    for (b in bytes) {
        list.add(b)
    }
}

func buildFrame(payload: Array<UInt8>, frameType!: UInt8, flags!: UInt8, streamId!: UInt32): Array<UInt8> {
    let frame = ArrayList<UInt8>(payload.size + 9)
    let len = UInt32(payload.size)
    frame.add(UInt8((len >> 16) & 0xFF))
    frame.add(UInt8((len >> 8) & 0xFF))
    frame.add(UInt8(len & 0xFF))
    frame.add(frameType)
    frame.add(flags)
    frame.add(UInt8((streamId >> 24) & 0x7F))
    frame.add(UInt8((streamId >> 16) & 0xFF))
    frame.add(UInt8((streamId >> 8) & 0xFF))
    frame.add(UInt8(streamId & 0xFF))
    frame.add(all: payload)
    return frame.toArray()
}

func readFrame(tlsClient: TlsSocket): ?H2Frame {
    let header = Array<UInt8>(9, repeat: 0)
    var off: Int64 = 0
    while (off < 9) {
        let n = tlsClient.read(header[off..])
        if (n <= 0) {
            return None
        }
        off += n
    }
    let len = (UInt32(header[0]) << 16) + (UInt32(header[1]) << 8) + UInt32(header[2])
    let frameType = header[3]
    let streamId = (UInt32(header[5]) << 24) + (UInt32(header[6]) << 16) +
        (UInt32(header[7]) << 8) + UInt32(header[8])
    let payload = Array<UInt8>(Int64(len), repeat: 0)
    off = 0
    while (off < Int64(len)) {
        let n = tlsClient.read(payload[off..])
        if (n <= 0) {
            return None
        }
        off += n
    }
    return Some(H2Frame(frameType, streamId, payload))
}

func parseGoawayErrorCode(payload: Array<UInt8>): ?UInt32 {
    if (payload.size < 8) {
        return None
    }
    return Some((UInt32(payload[4]) << 24) + (UInt32(payload[5]) << 16) +
        (UInt32(payload[6]) << 8) + UInt32(payload[7]))
}
