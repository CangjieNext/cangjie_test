/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./../bodyReadUtil
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt bodyReadUtil/read.cj -o read.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f read.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class Server
 *          Test invokes the write method of HttpResponseWriter for multiple times,
 *          the response is generated as multiple chunks.
 * Test API:
 *       public func write(buf: Array<Byte>): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.net.tls
import stdx.crypto.kit

import bodyReadUtil.*

@Test
class TestServer11WriterMutil {
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
                    httpContext
                        .responseBuilder
                        .header("transfer-encoding", "chunked")
                        .header("Trailer", "language")
                        .trailer("language", "English")
                    let writer = HttpResponseWriter(httpContext)
                    writer.write("hello".toArray())
                    writer.write(Array<Byte>())
                    writer.write(" ".toArray())
                    writer.write("world".toArray())
                }
            )
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        let client = ClientBuilder().build()
        let r = HttpRequestBuilder().url("http://127.0.0.1:${port}/hello").header("Connection", "close").build()
        let real = client.send(r)
        let body = readAll(11, real)
        sleep(Duration.millisecond * 100)

        @Expect(body, message)

        let language = real.trailers.getFirst("language") ?? ""
        @Expect("English", language)
        client.close()
    }
}
