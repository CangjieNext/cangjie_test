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
 *      RFC 7541 section 4.4: an attempt to add an entry larger than the
 *      maximum size of the dynamic table causes the table to be emptied of
 *      all existing entries. Therefore, when the ENCODER is asked to emit a
 *      header field whose size exceeds the dynamic table maximum size, it
 *      must not use the "Literal Header Field with Incremental Indexing"
 *      representation: the peer decoder would have to empty its own table.
 *      Instead the field must be emitted as "Literal Header Field without
 *      Indexing" (RFC 7541 section 6.2.2), leaving both dynamic tables
 *      untouched.
 *
 *      This test opens a raw HTTP/2 connection (TLS + ALPN "h2"), requests a
 *      resource whose response contains an oversized custom header
 *      ("x-big: a*4100", fieldSize = 6 + 4100 + 32 = 4138 > 4096) and walks
 *      the response HPACK header block (string literals are skipped without
 *      decoding, so Huffman encoding does not matter):
 *        - compliant encoder: the oversized field is emitted as literal
 *          without indexing (0x00 prefix) and no incremental-indexing entry
 *          of that size exists;
 *        - buggy encoder: the oversized field is emitted as literal with
 *          incremental indexing (0x40 prefix), inserting it into the encoder
 *          dynamic table and emptying all previously inserted entries.
 *
 *      A second request on the same connection verifies that the connection
 *      stays healthy and subsequent responses are served correctly.
 *
 * Test API:
 *      Encoder#encodeTo (indirectly, via HTTP/2 HPACK encoding on server side)
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

let H2_FRAME_DATA: UInt8 = 0x00
let H2_FRAME_HEADERS: UInt8 = 0x01
let H2_FRAME_GOAWAY: UInt8 = 0x07

let H2_PREFACE = "PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n".toArray()
let H2_EMPTY_SETTINGS: Array<UInt8> = [0, 0, 0, 4, 0, 0, 0, 0, 0]
let H2_SETTINGS_ACK: Array<UInt8> = [0, 0, 0, 4, 1, 0, 0, 0, 0]

// representation kinds recorded by the minimal HPACK block walker
let REP_INDEXED: UInt8 = 1
let REP_SIZE_UPDATE: UInt8 = 2
let REP_INCREMENTAL: UInt8 = 3
let REP_WITHOUT: UInt8 = 4
let REP_NEVER: UInt8 = 5

struct H2Frame {
    H2Frame(let frameType: UInt8, let streamId: UInt32, let flags: UInt8, let payload: Array<UInt8>) {}
}

struct ParsedEntry {
    ParsedEntry(let rep: UInt8, let valueLength: Int64) {}
}

struct ResponseResult {
    ResponseResult(let headerBlock: ?Array<UInt8>, let body: Array<UInt8>, let goaway: Bool) {}
}

@Test
class TestHpackEncoderOversizedField {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func testOversizedFieldWithoutIndexing(): Unit {
        server.distributor.register("/", { ctx =>
            ctx.responseBuilder.header("x-big", bigHeaderValue()).body("ok")
        })
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 100)

        let tcp = TcpSocket("127.0.0.1", server.port)
        tcp.connect()
        tcp.readTimeout = Duration.second * 5
        let tlsClient = TlsSocket.client(tcp, clientConfig: clientConfig())
        tlsClient.handshake()
        tlsClient.write(H2_PREFACE)
        tlsClient.write(H2_EMPTY_SETTINGS)
        sleep(Duration.millisecond * 100)
        tlsClient.write(H2_SETTINGS_ACK)

        // request 1 (stream 1): response contains the oversized header
        tlsClient.write(buildFrame(requestHeaderBlock(), frameType: H2_FRAME_HEADERS,
            flags: 0x05, streamId: 1)) // END_STREAM | END_HEADERS
        let resp1 = readResponse(tlsClient, 1)
        @Expect(resp1.goaway, false)
        @Expect(String.fromUtf8(resp1.body) == "ok", true)

        let block1 = resp1.headerBlock ?? Array<UInt8>(0, repeat: 0)
        let entries1 = parseHpackEntries(block1)
        var bigIncremental = false
        var bigWithout = false
        for (e in entries1) {
            if (e.valueLength > 2000) { // only the oversized value can reach this size
                println("big entry: rep=${e.rep}, valueLength=${e.valueLength}")
                if (e.rep == REP_INCREMENTAL) {
                    bigIncremental = true
                }
                if (e.rep == REP_WITHOUT || e.rep == REP_NEVER) {
                    bigWithout = true
                }
            }
        }
        println("entries1 count=${entries1.size}, bigIncremental=${bigIncremental}, bigWithout=${bigWithout}")
        // Buggy encoder inserts the oversized entry with incremental indexing.
        @Expect(bigIncremental, false)
        // Compliant encoder emits it without indexing, keeping its table intact.
        @Expect(bigWithout, true)

        // request 2 (stream 3): the connection stays healthy on the same
        // connection and the response is served correctly.
        tlsClient.write(buildFrame(requestHeaderBlock(), frameType: H2_FRAME_HEADERS,
            flags: 0x05, streamId: 3)) // END_STREAM | END_HEADERS
        let resp3 = readResponse(tlsClient, 3)
        @Expect(resp3.goaway, false)
        @Expect(String.fromUtf8(resp3.body) == "ok", true)
        @Expect((resp3.headerBlock ?? Array<UInt8>(0, repeat: 0)).size > 0, true)

        tlsClient.close()
        server.close()
        asanGC()
    }

    /*
     * Read frames until the response on the given stream is complete
     * (END_STREAM) or a GOAWAY arrives. Collects the header block payload
     * and the body data.
     */
    func readResponse(tlsClient: TlsSocket, streamId: UInt32): ResponseResult {
        var headerBlock: ?Array<UInt8> = None
        let body = ArrayList<UInt8>()
        var goaway = false
        var done = false
        while (!done) {
            let frameOpt = readFrame(tlsClient)
            if (let Some(frame) <- frameOpt) {
                if (frame.frameType == H2_FRAME_GOAWAY) {
                    goaway = true
                    break
                }
                if (frame.streamId != streamId) {
                    continue
                }
                if (frame.frameType == H2_FRAME_HEADERS) {
                    var block = frame.payload
                    if ((frame.flags & 0x20) != 0 && block.size >= 5) { // priority present
                        block = block[5..]
                    }
                    headerBlock = Some(block)
                    if ((frame.flags & 0x01) != 0) { // END_STREAM
                        done = true
                    }
                } else if (frame.frameType == H2_FRAME_DATA) {
                    for (b in frame.payload) {
                        body.add(b)
                    }
                    if ((frame.flags & 0x01) != 0) { // END_STREAM
                        done = true
                    }
                }
            } else {
                break // connection closed by peer or read timeout
            }
        }
        return ResponseResult(headerBlock, body.toArray(), goaway)
    }
}

func bigHeaderValue(): String {
    return String.fromUtf8(Array<UInt8>(4100, repeat: 0x61)) // 'a' * 4100
}

/*
 * Minimal request header block: pseudo headers via static table indexes
 * (:method GET, :path /, :scheme https) plus :authority as a literal
 * without indexing.
 */
func requestHeaderBlock(): Array<UInt8> {
    let block = ArrayList<UInt8>()
    block.add(0x82) // indexed field: :method GET (static index 2)
    block.add(0x84) // indexed field: :path / (static index 4)
    block.add(0x87) // indexed field: :scheme https (static index 7)
    block.add(0x01) // literal without indexing, name: :authority (static index 1)
    block.add(0x09) // value length 9
    block.add(all: "127.0.0.1".toArray())
    return block.toArray()
}

/*
 * HPACK integer with the given prefix mask (RFC 7541 section 5.1).
 * Returns (value, bytesConsumed) where bytesConsumed includes the first byte.
 */
func readHpackInt(block: Array<UInt8>, start: Int64, mask: Int64): (Int64, Int64) {
    let first = Int64(block[start]) & mask
    if (first < mask) {
        return (first, 1)
    }
    var value = mask
    var consumed: Int64 = 1
    var mult: Int64 = 1
    while (true) {
        let b = Int64(block[start + consumed])
        value += (b & 0x7F) * mult
        mult *= 128
        consumed += 1
        if ((b & 0x80) == 0) {
            break
        }
    }
    return (value, consumed)
}

/*
 * Total number of bytes of a string literal at the given offset:
 * H flag + length varint + payload (payload skipped without decoding, so
 * raw and Huffman encoded strings are handled the same way).
 */
func readStringAdvance(block: Array<UInt8>, start: Int64): Int64 {
    let len = readHpackInt(block, start, 0x7F)
    return len[1] + len[0]
}

/*
 * Minimal HPACK header block walker. Records the representation kind and the
 * encoded value length of every literal entry. Used to check which HPACK
 * representation the encoder chose for the oversized field.
 */
func parseHpackEntries(block: Array<UInt8>): ArrayList<ParsedEntry> {
    let entries = ArrayList<ParsedEntry>()
    var i: Int64 = 0
    while (i < block.size) {
        let b = Int64(block[i])
        if ((b & 0x80) != 0) { // indexed header field
            entries.add(ParsedEntry(REP_INDEXED, 0))
            i += readHpackInt(block, i, 0x7F)[1]
        } else if ((b & 0xE0) == 0x20) { // dynamic table size update
            entries.add(ParsedEntry(REP_SIZE_UPDATE, 0))
            i += readHpackInt(block, i, 0x1F)[1]
        } else { // literal header field
            let rep = if ((b & 0xC0) == 0x40) { REP_INCREMENTAL }
                else if ((b & 0xF0) == 0x10) { REP_NEVER }
                else { REP_WITHOUT }
            let mask = if ((b & 0xC0) == 0x40) { 0x3F } else { 0x0F }
            i += 1
            if ((b & mask) == 0) {
                i += readStringAdvance(block, i) // new name string
            } else if ((b & mask) == mask) {
                i += readHpackInt(block, i - 1, mask)[1] - 1 // name index continues
            }
            let v = readHpackInt(block, i, 0x7F) // value string length
            entries.add(ParsedEntry(rep, v[0]))
            i += v[1] + v[0]
        }
    }
    return entries
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
    let flags = header[4]
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
    return Some(H2Frame(frameType, streamId, flags, payload))
}
