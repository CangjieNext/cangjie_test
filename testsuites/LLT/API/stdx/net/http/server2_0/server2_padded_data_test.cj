/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
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

package tests.server2_0

import std.collection.*
import std.io.*
import std.net.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*
import stdx.net.tls.*
import {asan.*, tlsconfig.*}

private let TEST_BODY = "0123456789abcdefghijklmnopqrstuv".toArray()
private let RESULT_TIMEOUT = Duration.second * 2

private func makeFrame(frameType: UInt8, flags: UInt8, streamId: UInt32, payload: Array<UInt8>): Array<UInt8> {
    let length = UInt32(payload.size)
    let frame = Array<UInt8>(payload.size + 9, repeat: 0)
    frame[0] = UInt8(length >> 16)
    frame[1] = UInt8(length >> 8)
    frame[2] = UInt8(length)
    frame[3] = frameType
    frame[4] = flags
    frame[5] = UInt8(streamId >> 24) & 0x7f
    frame[6] = UInt8(streamId >> 16)
    frame[7] = UInt8(streamId >> 8)
    frame[8] = UInt8(streamId)
    for (i in 0..payload.size) {
        frame[i + 9] = payload[i]
    }
    return frame
}

private func requestHeaders(includeContentLength: Bool): Array<UInt8> {
    let headers = ArrayList<UInt8>([
        0x83, // :method: POST
        0x87, // :scheme: https
        0x04, 0x05, 0x2f, 0x65, 0x63, 0x68, 0x6f, // :path: /echo
        0x01, 0x09, 0x31, 0x32, 0x37, 0x2e, 0x30, 0x2e, 0x30, 0x2e, 0x31 // :authority: 127.0.0.1
    ])
    if (includeContentLength) {
        // Literal without indexing; static-table name index 28 is content-length.
        headers.add(0x0f)
        headers.add(0x0d)
        headers.add(0x02)
        headers.add(0x33)
        headers.add(0x32)
    }
    return headers.toArray()
}

private func paddedPayload(data: Array<UInt8>, padLength: UInt8): Array<UInt8> {
    let payload = Array<UInt8>(data.size + Int64(padLength) + 1, repeat: 0)
    payload[0] = padLength
    for (i in 0..data.size) {
        payload[i + 1] = data[i]
    }
    return payload
}

private func readBody(body: InputStream): Array<UInt8> {
    let result = ArrayList<UInt8>()
    let buffer = Array<UInt8>(16, repeat: 0)
    var size = body.read(buffer)
    while (size > 0) {
        for (i in 0..size) {
            result.add(buffer[i])
        }
        size = body.read(buffer)
    }
    return result.toArray()
}

private func sendPaddedRequest(port: UInt16, includeContentLength: Bool, result: AtomicInt64): Unit {
    let tcp = TcpSocket("127.0.0.1", port)
    tcp.connect()
    let tls = TlsSocket.client(tcp, session: None, clientConfig: clientConfig())
    tls.handshake()
    tls.write("PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n".toArray())
    tls.write(makeFrame(0x04, 0x00, 0, []))
    tls.write(makeFrame(0x01, 0x04, 1, requestHeaders(includeContentLength)))
    tls.write(makeFrame(0x00, 0x09, 1, paddedPayload(TEST_BODY, 8)))

    let deadline = MonoTime.now() + RESULT_TIMEOUT
    while (result.load() == 0 && MonoTime.now() < deadline) {
        sleep(Duration.millisecond * 10)
    }

    tls.close()
    tcp.close()
}

@Test
class TestServerPaddedDataH2 {
    private func runCase(includeContentLength: Bool): Unit {
        let result = AtomicInt64(0)
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
        server.distributor.register(
            "/echo",
            {context =>
                try {
                    result.store(if (readBody(context.request.body) == TEST_BODY) {1} else {-1})
                    let _ = context.responseBuilder.body("ok")
                } catch (_: Exception) {
                    result.store(-1)
                }
            }
        )
        spawn {server.serve()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        sendPaddedRequest(server.port, includeContentLength, result)

        let observed = result.load()
        server.close()
        @Expect(observed, 1)
    }

    @TestCase
    func paddedDataWithContentLength(): Unit {
        runCase(true)
    }

    @TestCase
    func paddedDataWithoutContentLength(): Unit {
        runCase(false)
        asanGC()
    }
}
