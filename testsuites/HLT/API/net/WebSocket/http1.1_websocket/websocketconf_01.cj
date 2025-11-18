/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output  %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
/*
 * Test description:
 *      Test WebSocket
 * Test API:
 *      public class WebSocket {}
 */

import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.collection.*
import stdx.log.*
import stdx.logger.*
import std.console.Console

@Test
class Testwebsocketconf_01 {
    @TestCase
    func test_01(): Unit {
        //the server write the data and client read the data
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()

        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(
                ctx,
                userFunc: {
                    request: HttpRequest =>
                    let value = request.headers.getFirst("test") ?? ""
                    @Expect(value, "zpstest")
                    let headers = HttpHeaders()
                    headers.add("resp", value)
                    headers
                }
            )
            websocketServer.write(TextWebFrame, "hello".toArray())
            websocketServer.closeConn()
        }
        func startServer() {
            server.logger.level = LogLevel.DEBUG
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")
        let headers = HttpHeaders()
        headers.add("test", "zpstest")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, headers: headers)
        let value1 = respHeaders.getFirst("resp") ?? ""
        @Expect(value1, "zpstest")

        let data = ArrayList<UInt8>()
        var frame = websocket.read()
        while (true) {
            match (frame.frameType) {
                case ContinuationWebFrame =>
                    data.add(all: frame.payload)
                    if (frame.fin) {
                        break
                    }
                case TextWebFrame | BinaryWebFrame =>
                    if (!data.isEmpty()) {
                        throw Exception("invalid frame")
                    }
                    data.add(all: frame.payload)
                    if (frame.fin) {
                        break
                    }
                case CloseWebFrame =>
                    websocket.write(CloseWebFrame, frame.payload)
                    break
                case PingWebFrame => websocket.writePongFrame(frame.payload)
                case _ => ()
            }
            frame = websocket.read()
        }

        @Expect(data.size, 5)
        @Expect(String.fromUtf8(data.toArray()), "hello")
        websocket.closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func test_02(): Unit {
        //the client write the data and server read the data
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()

        func handler1(ctx: HttpContext): Unit {
            let websocketServer = WebSocket.upgradeFromServer(
                ctx,
                userFunc: {
                    request: HttpRequest =>
                    let value = request.headers.getFirst("test") ?? ""
                    @Expect(value, "zpstest")
                    let headers = HttpHeaders()
                    headers.add("resp", value)
                    headers
                }
            )

            let data = ArrayList<UInt8>()
            var frame = websocketServer.read()
            while (true) {
                match (frame.frameType) {
                    case ContinuationWebFrame =>
                        data.add(all: frame.payload)
                        if (frame.fin) {
                            break
                        }
                    case TextWebFrame | BinaryWebFrame =>
                        if (!data.isEmpty()) {
                            throw Exception("invalid frame")
                        }
                        data.add(all: frame.payload)
                        if (frame.fin) {
                            break
                        }
                    case CloseWebFrame =>
                        websocketServer.write(CloseWebFrame, frame.payload)
                        break
                    case PingWebFrame => websocketServer.writePongFrame(frame.payload)
                    case _ => ()
                }
                frame = websocketServer.read()
            }
            @Expect(data.size, 4097)
            @Expect(data.toArray(), Array<UInt8>(4097, repeat: 97))
            websocketServer.closeConn()
        }
        func startServer() {
            server.logger.level = LogLevel.DEBUG
            server.distributor.register("/webSocket", handler1)
            server.serve()
        }
        spawn {startServer()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")
        let headers = HttpHeaders()
        headers.add("test", "zpstest")
        let websocket: WebSocket
        let respHeaders: HttpHeaders
        (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, headers: headers)
        let value1 = respHeaders.getFirst("resp") ?? ""
        @Expect(value1, "zpstest")
        websocket.write(TextWebFrame, Array<UInt8>(4097, repeat: 97))

        websocket.closeConn()
        client.close()
        server.close()
    }
}
