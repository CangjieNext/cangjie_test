/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.net.http.*
import std.time.*
import std.sync.*
import std.collection.*
import std.io.*
import std.net.*

var port = UInt16(0)
var ser = Option<TcpServerSocket>.None
var bound = AtomicUInt16(0)

// client 向 server 发 chunked body, body 部分以 8 * 1024 分开发送
@Test
class Test_Chunk_03 {
    public override func beforeEach(): Unit {
        bound = AtomicUInt16(0)
    }
    func startserve(): Unit {
        var server = TcpServerSocket(bindAt: 0)
        server.bind()
        bound.fetchAdd(1)
        ser = Option<TcpServerSocket>.Some(server)
        port = (server.localAddress as IPSocketAddress)?.port ?? 0

        var socket = server.accept()

        var buf = Array<Byte>(6 * 8 * 1024, repeat: 0)
        var readsum = 0
        var count = 0
        while (readsum < 5 * 8 * 1024 + 5) {
            var readlen1 = socket.read(buf)
            var readbuf = String.fromUtf8(buf[0..readlen1])
            readsum += readlen1
            count += 1
        }
        @Expect(count >= 1, true)
        socket.write("HTTP/1.1 200 OK\r\n\r\n".toArray())
    }

    // client发送 chunked body
    @TestCase
    func test_01(): Unit {
        spawn {
            startserve()
        }

        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var arr_16 = Array<UInt8>(5 * 8 * 1024, repeat: 33)
        var req1 = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/test/a")
            .header("transfer-encoding", "chunked")
            .header("Trailer", "12345")
            .trailer("12345", "ssdlh")
            .body(arr_16)
            .build()
        var client = ClientBuilder().build()
        var res1 = client.send(req1)
        @Expect(res1.status, 200)
        client.close()
        ser.getOrThrow().close()
    }

    // client发送 chunked body
    @TestCase
    func test_02(): Unit {
        spawn {
            startserve()
        }

        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var req1 = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/test/a")
            .header("transfer-encoding", "chunked")
            .header("Trailer", "12345")
            .trailer("12345", "444")
            .body(String(Array<Rune>(5 * 8 * 1024, repeat: r'a')))
            .build()
        var client = ClientBuilder().build()
        var res1 = client.send(req1)
        @Expect(res1.status, 200)
        client.close()
        ser.getOrThrow().close()
    }

    // client发送 chunked body
    @TestCase
    func test_03(): Unit {
        spawn {
            startserve()
        }

        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var ins = ByteBuffer()
        ins.write(Array<Byte>(5 * 8 * 1024, repeat: 31))
        var req1 = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/test/a")
            .header("transfer-encoding", "chunked")
            .header("Trailer", "12345")
            .trailer("12345", "333")
            .body(ins)
            .build()
        var client = ClientBuilder().build()
        var res1 = client.send(req1)
        @Expect(res1.status, 200)
        client.close()
        ser.getOrThrow().close()
    }
}
