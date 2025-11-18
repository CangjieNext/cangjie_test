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
 * Test API: public func trailer(key: String, value: String): HttpRequestBuilder
 */

import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import std.collection.*
import std.time.*
import std.sync.*

var port = UInt16(0)
var server = ServerBuilder().addr("127.0.0.1").port(0).build()

@Test
class Test_HttpRequestBuilder_Trailer_03 {
    func startserve(): Unit {
        server
            .distributor
            .register(
                "/ok",
                {
                    httpContext =>
                    var bodyBuf = Array<UInt8>(100, repeat: 0)
                    //需要读取body
                    httpContext.request.body.read(bodyBuf)
                    @Expect(ArrayList<String>(httpContext.request.trailers.get("123")), ArrayList<String>([]))
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
        var req1 = HttpRequestBuilder()
            .version(HTTP1_1)
            .header("Trailer", "123")
            .trailer("123", "123")
            .body("456")
            .url("http://127.0.0.1:${port}/ok")
            .build()
        // http1.1未设置Trailer
        var req2 = HttpRequestBuilder()
            .version(HTTP1_1)
            .header("transfer-encoding", "chunked")
            .trailer("123", "123")
            .body("456")
            .url("http://127.0.0.1:${port}/ok")
            .build()
        let client = ClientBuilder().build()
        client.send(req1)
        client.send(req2)
        client.close()
        server.close()
    }
}
