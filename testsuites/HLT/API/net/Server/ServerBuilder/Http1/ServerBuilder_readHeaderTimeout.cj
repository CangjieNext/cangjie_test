/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run_stdx %output %run_utest_opt %run_args 2>&1 | compare %f
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.log.*
import stdx.logger.*
import std.console.Console

func send_request(s: Server) {
    let client = ClientBuilder().build()
    let big = "12345" * 1024
    let request = HttpRequestBuilder()
        .header("Content-Length", "10")
        .header("a", big)
        .url("http://127.0.0.1:${s.port}")
        .body("1234567890")
        .build()

    let response = client.send(request)
    return response
}

func send_partial_header_request(s: Server): Bool {
    var socket = TcpSocket("127.0.0.1", s.port)
    let prefix = "POST / HTTP/1.1\r\nhost: 127.0.0.1:${s.port}\r\ncontent-length: 10\r\na: "
    let suffix = ("12345" * 1024) + "\r\n\r\n1234567890"
    var buf = Array<UInt8>(10000, repeat: 0)

    try {
        socket.connect(timeout: Duration.second)
        socket.write(prefix.toArray())
        sleep(Duration.millisecond * 20)
        try {
            socket.write(suffix.toArray())
        } catch (_: SocketException) {
        }
        let readLen = socket.read(buf)
        if (readLen <= 0) {
            return true
        }
        let response = String.fromUtf8(buf[0..readLen])
        return response.contains("HTTP/1.1 408 Request Timeout")
    } catch (_: SocketException | ConnectionException) {
        return true
    } finally {
        socket.close()
    }
}

@Test
public class Test_readHeaderTimeout {
    var cnt = 0
    public override func beforeEach(): Unit {
        cnt = 0
    }

    @TestCase
    func default(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        @Expect(server.readHeaderTimeout, Duration.Max)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        let response = send_request(server)
        server.close()
    }

    @TestCase
    func max(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).readHeaderTimeout(Duration.Max).build()
        @Expect(server.readHeaderTimeout, Duration.Max)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        let response = send_request(server)
        server.close()
    }

    @TestCase
    func zero(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).readHeaderTimeout(Duration.Zero).build()
        server.logger.level = LogLevel.TRACE
        @Expect(server.readHeaderTimeout, Duration.Zero)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        @Expect(send_partial_header_request(server), true)
        server.close()
    }

    @TestCase
    func negative(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).readHeaderTimeout(Duration.nanosecond * -1).build()
        server.logger.level = LogLevel.TRACE
        @Expect(server.readHeaderTimeout, Duration.Zero)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        @Expect(send_partial_header_request(server), true)
        server.close()
    }
}

// ASSERT: scan read header timeout
