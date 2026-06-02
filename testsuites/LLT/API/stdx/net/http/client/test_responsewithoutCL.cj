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
// ASSERT: scan HTTP/1.0 200 OK
// ASSERT: scan [(value, I'm JSON.)]

/*
 * Test description:
 *      Test class Client
 *          If HTTP/1.0 message received, while response without `Content-Length`.
 *       public func get(url: String): Unit
 *
 * Ref: https://www.rfc-editor.org/rfc/rfc9112.html#name-message-body-length
 *   Otherwise, this is a response message without a declared message body length, so the message body length is
 *   determined by the number of octets received prior to the server closing the connection.
 */

import std.net.*
import std.time.*
import std.sync.*
import stdx.net.http.*
import stdx.log.*
import stdx.encoding.json.stream.*
import std.collection.*
import asan.*

@Test
class TestHttp10ResponseWithoutCL {
    @TestCase
    func test(): Unit {
        let server = startServer()
        let port = (server.localAddress as IPSocketAddress)?.port ?? 0

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let rsp = client.get("http://localhost:${port}/index")

        let reader = JsonReader(rsp.body)
        let infos = reader.readValue<HashMap<String, String>>()
        println("${infos}")

        client.close()
        server.close()
        asanGC()
    }

    func startServer(): TcpServerSocket {
        let l = TcpServerSocket(bindAt: 0)
        l.bind()

        spawn {
            let s = l.accept()

            // consume the request
            s.read(Array<Byte>(200, repeat: 0))

            s.write("HTTP/1.0 200 OK\r\n\r\n{\"value\": \"I'm JSON.\"}".toArray())
            sleep(Duration.millisecond * 100) // waiting for client to read
            s.close()
        }
        sleep(Duration.millisecond * 10)
        return l
    }
}
