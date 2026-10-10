/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      test that a fully read chunked request keeps its bodySize when copied
 *      by HttpRequestBuilder, and that replacing the body with body(...)
 *      recalculates the bodySize from the new body.
 * Test API:
 *      public init(request: HttpRequest)
 *      public func body(body: Array<UInt8>): HttpRequestBuilder
 */

package tests.request

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit

import stdx.log.*
import asan.*
import std.collection.*
import std.io.*

@Test
class TestServerRequestCopyBodySize {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func copyChunkedRequestTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        let client = ClientBuilder().build()
        let request = HttpRequestBuilder()
            .get()
            .url("http://127.0.0.1:${port}/contentChunk")
            .header("Transfer-Encoding", "chunked")
            .body(Array<UInt8>(16 * 1000, repeat: 33))
            .build()
        let rsp = client.send(request)
        // handler中断言失败会以500响应返回，此处校验handler执行成功
        @Expect(rsp.status, 200)
        client.close()
        server.close()
    }

    func startServer() {
        server.distributor.register("/contentChunk", handler1)
        spawn {
            server.serve()
        }
    }

    func handler1(ctx: HttpContext): Unit {
        let req = ctx.request
        let buf = Array<Byte>(20000, repeat: 0)
        var allBody = ArrayList<UInt8>()
        var readLen = req.body.read(buf)
        while (readLen > 0) {
            allBody.add(all: buf[..readLen])
            readLen = req.body.read(buf)
        }
        // server读完chunked请求body后，bodySize为实际解码长度
        @Expect(allBody.toArray().size, 16000)
        @Expect(req.bodySize, Some(16000))
        // 克隆请求保留读完后的bodySize
        let copied = HttpRequestBuilder(req).build()
        @Expect(copied.bodySize, Some(16000))
        // 克隆后替换body，按新body重新计算bodySize
        let newArr = Array<UInt8>(123, repeat: 7)
        let replaced = HttpRequestBuilder(req).body(newArr).build()
        @Expect(replaced.bodySize, Some(123))
    }
}
