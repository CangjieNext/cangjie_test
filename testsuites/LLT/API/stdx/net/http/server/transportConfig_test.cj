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
 *      Test class ServerBuilder
 *          Test transportConfig can be accurately set
 * Test API:
 *       public func tlsConfig(config: TlsConfig): ServerBuilder
 */

package tests.server

import stdx.net.http.*
import std.net.*

@Test
class TestSetTransportConfig {
    let config = Config()
    var port = UInt16(0)
    let listener = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0u16))
    let server = ServerBuilder().listener(listener).transportConfig(config).build()

    @TestCase
    func receiveTest(): Unit {
        startServer()
        sleep(Duration.millisecond * 500)
        sendRequest()
        sleep(Duration.millisecond * 500)
        let serverfig = server.transportConfig
        @Expect(serverfig.readTimeout, Duration.second)
        @Expect(serverfig.writeTimeout, Duration.second)
        @Expect(serverfig.readBufferSize, 8192)
        @Expect(serverfig.writeBufferSize, 8192)
        @Expect(serverfig.keepAliveConfig, SocketKeepAliveConfig())
        server.close()
    }

    func startServer() {
        server.distributor.register("/hello", {_ => ()})
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        let client = TcpSocket("127.0.0.1", server.port)
        client.connect()

        let preface = "GET /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nTransfer-encoding: chunked\r\nConnection: close\r\n\r\n9\r\ntest for \r\n7\r\nchunked\r\n0\r\n\r\n"
            .toArray()
        client.write(preface)

        sleep(Duration.millisecond * 300)

        let arr = Array<UInt8>(1000, repeat: 0)
        let len = client.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))
        @Expect(resp.contains("200 OK"))
        client.close()
    }
}

func Config(): TransportConfig {
    var config = TransportConfig()

    config.readTimeout = Duration.second
    config.writeTimeout = Duration.second
    config.readBufferSize = 8 * 1024
    config.writeBufferSize = 8 * 1024
    let keepAliveConfig = SocketKeepAliveConfig()
    config.keepAliveConfig = keepAliveConfig
    return config
}
