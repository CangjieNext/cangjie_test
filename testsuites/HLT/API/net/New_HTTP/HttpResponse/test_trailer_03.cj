/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test illegal trailer function
 * Test API: public func trailer(key: String, value: String): HttpResponseBuilder
 */

import std.collection.*
import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import std.time.*
import std.sync.*

var port = UInt16(0)
var server = ServerBuilder().addr("127.0.0.1").port(0).build()

@Test
class Test_HttpResponseBuilder_Trailer_03 {
    func startserve(): Unit {
        // http1.1未设置Trailer
        server
            .distributor
            .register(
                "/fail1",
                {
                    httpContext =>
                    httpContext.responseBuilder.header("transfer-encoding", "chunked")
                    httpContext.responseBuilder.trailer("123", "123")
                    httpContext.responseBuilder.body("abcdefgIII")
                }
            )
        // http1.1未设置transfer-encoding
        server
            .distributor
            .register(
                "/fail2",
                {
                    httpContext =>
                    httpContext.responseBuilder.header("Trailer", "123")
                    httpContext.responseBuilder.trailer("123", "456")
                    httpContext.responseBuilder.body("abcdefgIII")
                }
            )
        server.serve()
    }

    @TestCase
    func test_trailer_01(): Unit {
        spawn {
            startserve()
        }

        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server.port
        // http1.1未设置transfer-encoding
        var req1 = HttpRequestBuilder().url("http://127.0.0.1:${port}/fail1").build()
        // http1.1未设置Trailer
        var req2 = HttpRequestBuilder().url("http://127.0.0.1:${port}/fail2").build()
        let client = ClientBuilder().build()
        var res1 = client.send(req1)
        var res2 = client.send(req2)
        var bodyBuf = Array<UInt8>(200, repeat: 0)
        //需要读取body
        while (res1.body.read(bodyBuf) != 0) {}
        while (res2.body.read(bodyBuf) != 0) {}
        @Expect(ArrayList<String>(res1.trailers.get("123")), ArrayList<String>([]))
        @Expect(ArrayList<String>(res2.trailers.get("123")), ArrayList<String>([]))
        client.close()
        server.close()
    }
}
