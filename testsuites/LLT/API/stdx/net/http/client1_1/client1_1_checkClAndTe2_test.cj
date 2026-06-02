/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Test Client1_1#checkRequest
 * Test API:
 *      func checkClAndTe(headers: HttpHeaders): (?Int64, Bool)
 */
package tests.client1_1

import stdx.net.http.*
import asan.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*
import std.io.*

@Test
class TestClient1_1CheckClAndTe2 {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func client1_1CheckClAndTe2(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.second)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let u = URL.parse("http://127.0.0.1:${(serverSocket.localAddress as IPSocketAddress)?.port ?? 0}/a")
        let r = HttpRequestBuilder()
            .url(u)
            .header("Content-Length", "12")
            .header("Content-Length", "12")
            .header("content-length", "12")
            .body("hello server".toArray())
            .build()
        client.send(r)
        client.close()
        fut.get()
        asanGC()
    }
    func serverPacketCapture() {
        serverSocket.bind()
        // server1
        let server = serverSocket.accept()
        sleep(Duration.millisecond * 100)
        let buf = Array<UInt8>(500, repeat: 0)
        let i = server.read(buf)
        let respString = String.fromUtf8(buf[..i])
        @Expect(respString.contains("content-length: 12\r\n"))
        @Expect(respString.contains("hello server"))
        server.write("HTTP/1.1 204 ok\r\nconnection: close\r\n\r\n".toArray())
        server.close()
        serverSocket.close()
    }

    @TestCase
    func client1_1CheckClAndTeContentLengthAndChunked(): Unit {
        let client = ClientBuilder().build()
        let u = URL.parse("http://127.0.0.1:80/a")
        let r = HttpRequestBuilder()
            .url(u)
            .header("Content-Length", "12")
            .header("Transfer-Encoding", "chunked")
            .body("hello server".toArray())
            .build()
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "The content-length and transfer-encoding can not be set together.")
        }

        client.close()
        println("checkClAndTe2_test_ok")
    }
}
/* SCAN-IN
checkClAndTe2_test_ok
 */
