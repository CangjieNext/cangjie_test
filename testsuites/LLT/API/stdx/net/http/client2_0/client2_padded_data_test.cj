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

package tests.client2_0

import std.collection.*
import std.io.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import stdx.crypto.kit.*
import stdx.encoding.url.URL
import stdx.net.http.*
import stdx.net.tls.*
import {asan.*, tlsconfig.*}

private let TEST_BODY = "0123456789abcdefghijklmnopqrstuv".toArray()
private let WEBSOCKET_FRAME: Array<UInt8> = [0x82, 0x05, 0x48, 0x45, 0x4c, 0x4c, 0x4f]

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

private func paddedPayload(data: Array<UInt8>, padLength: UInt8): Array<UInt8> {
    let payload = Array<UInt8>(data.size + Int64(padLength) + 1, repeat: 0)
    payload[0] = padLength
    for (i in 0..data.size) {
        payload[i + 1] = data[i]
    }
    return payload
}

private func readExactly(tls: TlsSocket, size: Int64): Array<UInt8> {
    let result = Array<UInt8>(size, repeat: 0)
    var offset: Int64 = 0
    while (offset < size) {
        let buffer = Array<UInt8>(size - offset, repeat: 0)
        let count = tls.read(buffer)
        if (count <= 0) {
            throw Exception("unexpected end of TLS stream")
        }
        for (i in 0..count) {
            result[offset + i] = buffer[i]
        }
        offset += count
    }
    return result
}

private func framePayloadLength(header: Array<UInt8>): Int64 {
    return (Int64(header[0]) << 16) | (Int64(header[1]) << 8) | Int64(header[2])
}

private func servePaddedResponse(
    listener: TcpServerSocket,
    data: Array<UInt8>,
    webSocket: Bool
): Unit {
    let accepted = listener.accept()
    let tls = TlsSocket.server(accepted, session: None, serverConfig: serverConfig())
    tls.handshake()
    tls.readTimeout = Duration.second * 5

    let _ = readExactly(tls, 24)
    let settingsPayload: Array<UInt8> = if (webSocket) {
        [0x00, 0x08, 0x00, 0x00, 0x00, 0x01]
    } else {
        []
    }
    tls.write(makeFrame(0x04, 0x00, 0, settingsPayload))

    var requestStream: UInt32 = 0
    while (requestStream == 0) {
        let header = readExactly(tls, 9)
        let payloadLength = framePayloadLength(header)
        if (payloadLength > 0) {
            let _ = readExactly(tls, payloadLength)
        }
        if (header[3] == 0x04 && (header[4] & 0x01) == 0) {
            tls.write(makeFrame(0x04, 0x01, 0, []))
        } else if (header[3] == 0x01) {
            requestStream = (UInt32(header[5] & 0x7f) << 24) |
                (UInt32(header[6]) << 16) |
                (UInt32(header[7]) << 8) |
                UInt32(header[8])
        }
    }

    tls.write(makeFrame(0x01, 0x04, requestStream, [0x88]))
    let flags: UInt8 = if (webSocket) {0x08} else {0x09}
    let padLength: UInt8 = if (webSocket) {2} else {8}
    tls.write(makeFrame(0x00, flags, requestStream, paddedPayload(data, padLength)))
    if (webSocket) {
        sleep(Duration.millisecond * 200)
    }
    tls.close()
    accepted.close()
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

@Test
class TestClientPaddedDataH2 {
    @TestCase
    func paddedResponseBody(): Unit {
        let listener = TcpServerSocket(bindAt: 0)
        listener.bind()
        let port = (listener.localAddress as IPSocketAddress)?.port ?? 0
        let serverFuture = spawn {servePaddedResponse(listener, TEST_BODY, false)}

        let client = ClientBuilder().tlsConfig(clientConfig()).readTimeout(Duration.second * 5).build()
        let request = HttpRequestBuilder()
            .get()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${port}/padded")
            .build()
        let response = client.send(request)

        @Expect(response.status, 200)
        @Expect(readBody(response.body), TEST_BODY)

        client.close()
        serverFuture.get()
        listener.close()
    }

    @TestCase
    func paddedWebSocketData(): Unit {
        let _ = DefaultCryptoKit()
        let listener = TcpServerSocket(bindAt: 0)
        listener.bind()
        let port = (listener.localAddress as IPSocketAddress)?.port ?? 0
        let serverFuture = spawn {servePaddedResponse(listener, WEBSOCKET_FRAME, true)}

        let client = ClientBuilder().tlsConfig(clientConfig()).readTimeout(Duration.second * 5).build()
        let (webSocket, _) = WebSocket.upgradeFromClient(
            client,
            URL.parse("wss://127.0.0.1:${port}/padded"),
            version: HTTP2_0
        )
        let frame = webSocket.read()

        @Expect(frame.frameType, BinaryWebFrame)
        @Expect(frame.fin, true)
        @Expect(frame.payload, "HELLO".toArray())

        webSocket.closeConn()
        client.close()
        serverFuture.get()
        listener.close()
        asanGC()
    }
}
