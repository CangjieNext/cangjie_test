/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class Server
 *          If the connection has been upgraded before responsewriter.write is called,
 *          HttpException is thrown.
 * Test API:
 *       public func write(buf: Array<Byte>): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.encoding.url.URL
import std.collection.ArrayList

@Test
class TestServer11WriterAfterUpgrade {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    let message = "hello world"

    @TestCase
    func chunkTest(): Unit {
        startServer()
        sleep(Duration.millisecond * 500)
        port = server.port
        sendRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server
            .distributor
            .register(
                "/hello",
                {
                    httpContext =>
                    let websocketServer = WebSocket.upgradeFromServer(httpContext,
                        subProtocols: ArrayList<String>(["foo", "bar", "foo1"]))
                    httpContext
                        .responseBuilder
                        .header("transfer-encoding", "chunked")
                        .header("Trailer", "language")
                        .trailer("language", "English")
                    let writer = HttpResponseWriter(httpContext)
                    try {
                        writer.write("hello world".toArray())
                        @Expect(1, 2)
                    } catch (e: HttpException) {
                        @Expect(e.message.contains("The connection is upgraded and response cannot be written"))
                    }
                    websocketServer.closeConn()
                }
            )
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.1:${server.port}/hello")
        let subProtocol = ArrayList<String>(["foo1", "bar1"])

        let websocket: WebSocket
        let headers: HttpHeaders
        (websocket, headers) = WebSocket.upgradeFromClient(client, u, subProtocols: subProtocol)
        sleep(Duration.millisecond * 100)
        websocket.closeConn()
        client.close()
    }
}
